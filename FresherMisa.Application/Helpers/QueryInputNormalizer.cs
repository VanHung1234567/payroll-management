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
        /// Chỉ cho phép SearchFields và Sort sử dụng các property có thật trên entity.
        /// </summary>
        /// <typeparam name="TEntity">Kiểu thực thể cần kiểm tra.</typeparam>
        /// <param name="request">Thông tin paging từ client.</param>
        /// <returns>Kết quả chuẩn hóa gồm SearchFields, Sort và lỗi nếu có.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        public static QueryNormalizeResult NormalizePaging<TEntity>(PagingRequest request)
        {
            var allowedFields = typeof(TEntity)
                .GetProperties(BindingFlags.Public | BindingFlags.Instance)
                .Where(property => property.Name != nameof(BaseModel.State)
                    && property.Name != nameof(BaseModel.IsDeleted))
                .Select(property => property.Name)
                .ToHashSet(StringComparer.OrdinalIgnoreCase);

            request.Search = NormalizeSearch(request.Search);

            var searchFieldsResult = NormalizeSearchFields(request.SearchFields, allowedFields);
            if (!searchFieldsResult.IsValid)
            {
                return searchFieldsResult;
            }

            var sortResult = NormalizeSort(request.Sort, allowedFields);
            if (!sortResult.IsValid)
            {
                return sortResult;
            }

            return new QueryNormalizeResult
            {
                SearchFields = searchFieldsResult.SearchFields,
                Sort = sortResult.Sort
            };
        }

        /// <summary>
        /// Chuẩn hóa chuỗi sắp xếp theo whitelist field.
        /// Chỉ giữ các field nằm trong allowedFields, hỗ trợ dấu '-' để sắp xếp giảm dần.
        /// </summary>
        /// <param name="sort">Chuỗi sort từ client.</param>
        /// <param name="allowedFields">Danh sách field được phép sort.</param>
        /// <returns>Kết quả chứa chuỗi sort hợp lệ hoặc lỗi nếu field không hợp lệ.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        public static QueryNormalizeResult NormalizeSort(
            string? sort,
            ISet<string> allowedFields)
        {
            if (string.IsNullOrWhiteSpace(sort))
            {
                return new QueryNormalizeResult();
            }

            var result = new List<string>();

            foreach (var item in sort.Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))
            {
                var isDescending = item.StartsWith("-");
                var fieldName = isDescending ? item[1..] : item;

                if (!TryGetAllowedField(fieldName, allowedFields, out var safeFieldName))
                {
                    return Invalid($"Trường sắp xếp không hợp lệ: {fieldName}");
                }

                result.Add(isDescending ? $"-{safeFieldName}" : safeFieldName);
            }

            return new QueryNormalizeResult
            {
                Sort = string.Join(",", result)
            };
        }

        /// <summary>
        /// Kiểm tra danh sách field lọc nâng cao theo whitelist.
        /// Hàm này chỉ kiểm tra FieldName vì FieldName có thể được ghép vào dynamic SQL trong procedure.
        /// </summary>
        /// <param name="filters">Danh sách bộ lọc nâng cao.</param>
        /// <param name="allowedFields">Danh sách field được phép lọc.</param>
        /// <returns>Kết quả hợp lệ hoặc lỗi nếu có field không nằm trong whitelist.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        public static QueryNormalizeResult ValidateAdvancedFilterFields(
            IEnumerable<AdvancedFilterItem>? filters,
            ISet<string> allowedFields)
        {
            if (filters == null)
            {
                return new QueryNormalizeResult();
            }

            foreach (var filter in filters)
            {
                if (!TryGetAllowedField(filter.FieldName, allowedFields, out var safeFieldName))
                {
                    return Invalid($"Trường lọc không hợp lệ: {filter.FieldName}");
                }

                filter.FieldName = safeFieldName;
            }

            return new QueryNormalizeResult();
        }

        /// <summary>
        /// Chuẩn hóa danh sách Guid phân tách bằng dấu ';'.
        /// Dùng cho các input dạng chuỗi id như OrganizationIDs trước khi gửi xuống procedure.
        /// </summary>
        /// <param name="value">Chuỗi Guid phân tách bằng dấu ';'.</param>
        /// <returns>Kết quả chứa chuỗi Guid hợp lệ hoặc lỗi nếu có id không hợp lệ.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        public static QueryNormalizeResult NormalizeGuidList(string? value)
        {
            if (string.IsNullOrWhiteSpace(value))
            {
                return new QueryNormalizeResult();
            }

            var result = new List<string>();

            foreach (var item in value.Split(';', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))
            {
                if (!Guid.TryParse(item, out var id) || id == Guid.Empty)
                {
                    return Invalid($"Id không hợp lệ: {item}");
                }

                result.Add(id.ToString());
            }

            return new QueryNormalizeResult
            {
                Value = string.Join(";", result)
            };
        }

        /// <summary>
        /// Chuẩn hóa từ khóa tìm kiếm.
        /// Search là value nên không cần whitelist field, chỉ trim và giới hạn độ dài.
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
        /// Chuẩn hóa danh sách field tìm kiếm theo whitelist.
        /// SearchFields có thể được procedure ghép thành tên cột trong dynamic SQL nên cần kiểm tra chặt.
        /// </summary>
        /// <param name="searchFieldsValue">Chuỗi field tìm kiếm, phân tách bằng dấu ';'.</param>
        /// <param name="allowedFields">Danh sách field được phép tìm kiếm.</param>
        /// <returns>Kết quả chứa danh sách field hợp lệ hoặc lỗi nếu có field không hợp lệ.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        private static QueryNormalizeResult NormalizeSearchFields(
            string? searchFieldsValue,
            ISet<string> allowedFields)
        {
            if (string.IsNullOrWhiteSpace(searchFieldsValue))
            {
                return new QueryNormalizeResult();
            }

            var result = new List<string>();

            foreach (var field in searchFieldsValue.Split(';', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))
            {
                if (!TryGetAllowedField(field, allowedFields, out var safeFieldName))
                {
                    return Invalid($"Trường tìm kiếm không hợp lệ: {field}");
                }

                result.Add(safeFieldName);
            }

            return new QueryNormalizeResult
            {
                SearchFields = result
            };
        }

        /// <summary>
        /// Kiểm tra field có nằm trong whitelist hay không.
        /// Trả về đúng tên field trong whitelist để chuẩn hóa hoa thường trước khi truyền xuống procedure.
        /// </summary>
        /// <param name="fieldName">Tên field cần kiểm tra.</param>
        /// <param name="allowedFields">Danh sách field được phép.</param>
        /// <param name="safeFieldName">Tên field hợp lệ đã chuẩn hóa theo whitelist.</param>
        /// <returns>True nếu field hợp lệ, ngược lại False.</returns>
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
                string.Equals(field, fieldName.Trim(), StringComparison.OrdinalIgnoreCase));

            if (matchedField == null)
            {
                return false;
            }

            safeFieldName = matchedField;
            return true;
        }

        /// <summary>
        /// Tạo kết quả lỗi validate.
        /// </summary>
        /// <param name="error">Thông báo lỗi.</param>
        /// <returns>Kết quả không hợp lệ.</returns>
        /// CREATED BY: VVHung (11/06/2026)
        private static QueryNormalizeResult Invalid(string error)
        {
            return new QueryNormalizeResult
            {
                IsValid = false,
                Error = error
            };
        }
    }
}
