using FresherMisa.Entities;
using FresherMisa.Entities.Enums;
using System.Reflection;

namespace FresherMisa.Application.Helpers
{
    /// <summary>
    /// Chuẩn hóa và kiểm tra dữ liệu đầu vào cho các API phân trang,
    /// tìm kiếm, sắp xếp và lọc nâng cao nhằm tránh SQL Injection.
    /// </summary>
    /// CREATED BY: VVHung (11/06/2026)
    public static class QueryInputNormalizer
    {
        /// <summary>
        /// Độ dài tối đa của từ khóa tìm kiếm.
        /// </summary>
        /// CREATED BY: VVHung (11/06/2026)
        private const int MaxSearchLength = 255;

        /// <summary>
        /// Chuẩn hóa dữ liệu paging trước khi truyền xuống repository.
        /// </summary>
        /// <typeparam name="TEntity">Kiểu thực thể cần kiểm tra.</typeparam>
        /// <param name="request">Thông tin paging từ client.</param>
        /// <param name="searchFields">Danh sách trường tìm kiếm hợp lệ.</param>
        /// <param name="sort">Chuỗi sắp xếp hợp lệ.</param>
        /// <param name="error">Thông báo lỗi nếu có.</param>
        /// <returns>True nếu dữ liệu hợp lệ, ngược lại False.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        public static bool TryNormalizePaging<TEntity>(
            PagingRequest request,
            out List<string> searchFields,
            out string sort,
            out string? error)
        {
            var allowedFields = typeof(TEntity)
                .GetProperties(BindingFlags.Public | BindingFlags.Instance)
                .Where(property => property.Name != nameof(BaseModel.State)
                    && property.Name != nameof(BaseModel.IsDeleted))
                .Select(property => property.Name)
                .ToHashSet(StringComparer.OrdinalIgnoreCase);

            searchFields = new List<string>();
            sort = string.Empty;
            error = null;

            request.Search = NormalizeSearch(request.Search);

            if (!TryNormalizeSearchFields(
                request.SearchFields,
                allowedFields,
                out searchFields,
                out error))
            {
                return false;
            }

            if (!TryNormalizeSort(
                request.Sort,
                allowedFields,
                out sort,
                out error))
            {
                return false;
            }

            return true;
        }

        /// <summary>
        /// Chuẩn hóa chuỗi sắp xếp theo whitelist field.
        /// </summary>
        /// <param name="sort">Chuỗi sort từ client.</param>
        /// <param name="allowedFields">Danh sách field được phép.</param>
        /// <param name="normalizedSort">Chuỗi sort sau khi chuẩn hóa.</param>
        /// <param name="error">Thông báo lỗi nếu có.</param>
        /// <returns>True nếu hợp lệ, ngược lại False.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        public static bool TryNormalizeSort(
            string? sort,
            ISet<string> allowedFields,
            out string normalizedSort,
            out string? error)
        {
            normalizedSort = string.Empty;
            error = null;

            if (string.IsNullOrWhiteSpace(sort))
            {
                return true;
            }

            var result = new List<string>();

            foreach (var item in sort.Split(
                ',',
                StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))
            {
                var isDescending = item.StartsWith("-");
                var fieldName = isDescending ? item[1..] : item;

                if (!TryGetAllowedField(
                    fieldName,
                    allowedFields,
                    out var safeFieldName))
                {
                    error = $"Trường sắp xếp không hợp lệ: {fieldName}";
                    return false;
                }

                result.Add(
                    isDescending
                        ? $"-{safeFieldName}"
                        : safeFieldName);
            }

            normalizedSort = string.Join(",", result);

            return true;
        }

        /// <summary>
        /// Kiểm tra danh sách field lọc nâng cao.
        /// </summary>
        /// <param name="filters">Danh sách bộ lọc nâng cao.</param>
        /// <param name="allowedFields">Danh sách field được phép.</param>
        /// <param name="error">Thông báo lỗi nếu có.</param>
        /// <returns>True nếu hợp lệ, ngược lại False.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        public static bool TryValidateAdvancedFilterFields(
            IEnumerable<AdvancedFilterItem>? filters,
            ISet<string> allowedFields,
            out string? error)
        {
            error = null;

            if (filters == null)
            {
                return true;
            }

            foreach (var filter in filters)
            {
                if (!TryGetAllowedField(
                    filter.FieldName,
                    allowedFields,
                    out var safeFieldName))
                {
                    error = $"Trường lọc không hợp lệ: {filter.FieldName}";
                    return false;
                }

                filter.FieldName = safeFieldName;
            }

            return true;
        }

        /// <summary>
        /// Chuẩn hóa danh sách Guid phân tách bằng dấu ';'.
        /// </summary>
        /// <param name="value">Chuỗi Guid.</param>
        /// <param name="normalizedValue">Chuỗi Guid hợp lệ.</param>
        /// <param name="error">Thông báo lỗi nếu có.</param>
        /// <returns>True nếu hợp lệ, ngược lại False.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        public static bool TryNormalizeGuidList(
            string? value,
            out string normalizedValue,
            out string? error)
        {
            normalizedValue = string.Empty;
            error = null;

            if (string.IsNullOrWhiteSpace(value))
            {
                return true;
            }

            var result = new List<string>();

            foreach (var item in value.Split(
                ';',
                StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))
            {
                if (!Guid.TryParse(item, out var id)
                    || id == Guid.Empty)
                {
                    error = $"Id không hợp lệ: {item}";
                    return false;
                }

                result.Add(id.ToString());
            }

            normalizedValue = string.Join(";", result);

            return true;
        }

        /// <summary>
        /// Chuẩn hóa từ khóa tìm kiếm.
        /// </summary>
        /// <param name="search">Từ khóa tìm kiếm.</param>
        /// <returns>Từ khóa sau khi chuẩn hóa.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        public static string NormalizeSearch(string? search)
        {
            if (string.IsNullOrWhiteSpace(search))
            {
                return string.Empty;
            }

            search = search.Trim();

            return search.Length <= MaxSearchLength
                ? search
                : search[..MaxSearchLength];
        }

        /// <summary>
        /// Chuẩn hóa danh sách field tìm kiếm.
        /// </summary>
        /// <param name="searchFieldsValue">Chuỗi field tìm kiếm.</param>
        /// <param name="allowedFields">Danh sách field được phép.</param>
        /// <param name="searchFields">Danh sách field hợp lệ.</param>
        /// <param name="error">Thông báo lỗi nếu có.</param>
        /// <returns>True nếu hợp lệ, ngược lại False.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        private static bool TryNormalizeSearchFields(
            string? searchFieldsValue,
            ISet<string> allowedFields,
            out List<string> searchFields,
            out string? error)
        {
            searchFields = new List<string>();
            error = null;

            if (string.IsNullOrWhiteSpace(searchFieldsValue))
            {
                return true;
            }

            foreach (var field in searchFieldsValue.Split(
                ';',
                StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))
            {
                if (!TryGetAllowedField(
                    field,
                    allowedFields,
                    out var safeFieldName))
                {
                    error = $"Trường tìm kiếm không hợp lệ: {field}";
                    return false;
                }

                searchFields.Add(safeFieldName);
            }

            return true;
        }

        /// <summary>
        /// Kiểm tra field có nằm trong whitelist hay không.
        /// </summary>
        /// <param name="fieldName">Tên field cần kiểm tra.</param>
        /// <param name="allowedFields">Danh sách field được phép.</param>
        /// <param name="safeFieldName">Tên field hợp lệ.</param>
        /// <returns>True nếu hợp lệ, ngược lại False.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        private static bool TryGetAllowedField(
            string? fieldName,
            ISet<string> allowedFields,
            out string safeFieldName)
        {
            safeFieldName = string.Empty;

            if (string.IsNullOrWhiteSpace(fieldName))
            {
                return false;
            }

            var matchedField = allowedFields.FirstOrDefault(field =>
                string.Equals(
                    field,
                    fieldName.Trim(),
                    StringComparison.OrdinalIgnoreCase));

            if (matchedField == null)
            {
                return false;
            }

            safeFieldName = matchedField;

            return true;
        }
    }
}