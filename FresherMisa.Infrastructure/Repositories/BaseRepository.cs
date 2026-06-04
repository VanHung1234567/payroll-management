using Dapper;
using FresherMisa.Application.Interfaces;
using FresherMisa.Entities;
using FresherMisa.Entities.Extensions;
using Microsoft.Extensions.Configuration;
using System.ComponentModel.DataAnnotations.Schema;
using MySqlConnector;
using System.Data;
using System.Reflection;
using System.Text;
using System.Text.Json;


namespace FresherMisa.Infrastructure.Repositories
{
    /// <summary>
    /// Base repository
    /// </summary>
    /// <typeparam name="TEntity"></typeparam>
    /// CREATED BY: VVHung (29/05/2026)
    public class BaseRepository<TEntity> : IBaseRepository<TEntity>, IDisposable where TEntity : BaseModel
    {
        //Properties
        string _connectionString = string.Empty;
        IConfiguration _configuration;
        protected IDbConnection _dbConnection = null;
        protected string _tableName;
        public Type _modelType = null;


        //Constructor
        public BaseRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = _configuration.GetConnectionString("DefaultConnection")!;
            _dbConnection = new MySqlConnection(_connectionString);
            _modelType = typeof(TEntity);
            _tableName = _modelType.GetTableName();
        }


        /// <summary>
        /// Dispose connection
        /// </summary>
        /// CREATED BY: VVHung (29/05/2026)
        public void Dispose()
        {
            if (_dbConnection != null && _dbConnection.State == ConnectionState.Open)
            {
                _dbConnection.Close();
                _dbConnection.Dispose();
            }
        }

        /// <summary>
        /// Mở kết nối database
        /// </summary>
        private async Task OpenConnectionAsync()
        {
            if (_dbConnection.State != ConnectionState.Open)
            {
                if (_dbConnection is MySqlConnection mySqlConnection)
                {
                    await mySqlConnection.OpenAsync();
                }
                else
                {
                    _dbConnection.Open();
                }
            }
        }

        #region Method Get
        /// <summary>
        /// Lấy danh sách entity
        /// </summary>
        /// <returns>Danh sách tất cả bản ghi</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<IEnumerable<BaseModel>> GetEntitiesAsync()
        {
            return await GetEntitiesUsingCommandTextAsync();
        }

        /// <summary>
        /// Lấy tất cả theo command text
        /// </summary>
        /// <returns></returns>
        /// CREATED BY: VVHung (29/05/2026)
        private async Task<IEnumerable<TEntity>> GetEntitiesUsingCommandTextAsync()
        {
            var query = new StringBuilder($"select {GetSelectColumns()} from {_tableName}");
            int whereCount = 0;

            if (_modelType.GetHasDeletedColumn())
            {
                whereCount++;
                query.Append($" where {ToSnakeCase(nameof(BaseModel.IsDeleted))} = FALSE");
            }

            var entities = await _dbConnection.QueryAsync<TEntity>(query.ToString(), commandType: CommandType.Text);

            return entities.ToList();
        }

        /// <summary>
        /// Lấy bản ghi theo id
        /// </summary>
        /// <param name="entityId">Id của bản ghi</param>
        /// <returns>Bản ghi tìm thấy hoặc null</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<TEntity> GetEntityByIDAsync(Guid entityId)
        {
            return await GetEntitieByIdUsingCommandTextAsync(entityId.ToString());
        }

        /// <summary>
        /// Lấy bản ghi theo id dùng command text
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        private async Task<TEntity> GetEntitieByIdUsingCommandTextAsync(string id)
        {
            var query = new StringBuilder($"select {GetSelectColumns()} from {_tableName}");
            int whereCount = 0;

            Func<StringBuilder, bool> AppendWhere = (query) =>
            {
                query.Append(whereCount == 0 ? " where " : " and ");
                return true;
            };

            var primaryKey = _modelType.GetKeyName();

            if (primaryKey != null)
            {
                AppendWhere(query);
                query.Append($"{ToSnakeCase(primaryKey)} = @Id");
                whereCount++;
            }

            if (_modelType.GetHasDeletedColumn())
            {
                AppendWhere(query);
                query.Append($"{ToSnakeCase(nameof(BaseModel.IsDeleted))} = FALSE");
                whereCount++;
            }

            var entities = await _dbConnection.QueryFirstOrDefaultAsync<TEntity>(query.ToString(), new { Id = id }, commandType: CommandType.Text);

            return entities;
        }

        /// <summary>
        /// Xóa bản ghi theo id
        /// </summary>
        /// <param name="entityId">Id của bản ghi</param>
        /// <returns>Số bản ghi bị xóa</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<int> DeleteAsync(Guid entityId)
        {
            var rowAffects = 0;
            await OpenConnectionAsync();

            using (var transaction = _dbConnection.BeginTransaction())
            {
                try
                {
                    //1. Lấy tên của khóa chính
                    var keyName = _modelType.GetKeyName();

                    var dynamicParams = new DynamicParameters();
                    dynamicParams.Add($"@v_{keyName}", entityId);

                    //2. Kết nối tới CSDL:
                    rowAffects = await _dbConnection.ExecuteAsync($"Proc_Delete{_modelType.Name}ById", param: dynamicParams, transaction: transaction, commandType: CommandType.StoredProcedure);

                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }
            }

            //3. Trả về số bản ghi bị ảnh hưởng
            return rowAffects;
        }


        /// <summary>
        /// Thêm bản ghi mới
        /// </summary>
        /// <param name="entity">Thông tin bản ghi</param>
        /// <returns>Số bản ghi thêm mới</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<int> InsertAsync(TEntity entity)
        {
            var rowAffects = 0;
            await OpenConnectionAsync();

            using (var transaction = _dbConnection.BeginTransaction())
            {
                try
                {
                    //1.Duyệt các thuộc tính trên bản ghi và tạo parameters
                    var parameters = MappingDbType(entity);

                    //2.Thực hiện thêm bản ghi
                    rowAffects = await _dbConnection.ExecuteAsync($"Proc_Insert{_modelType.Name}", param: parameters, transaction: transaction, commandType: CommandType.StoredProcedure);

                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }
            }

            //3.Trả về số bản ghi thêm mới
            return rowAffects;
        }

        /// <summary>
        /// Cập nhật thông tin bản ghi
        /// </summary>
        /// <param name="entityId">Id bản ghi</param>
        /// <param name="entity">Thông tin bản ghi</param>
        /// <returns>Số bản ghi bị ảnh hưởng</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<int> UpdateAsync(Guid entityId, TEntity entity)
        {
            var rowAffects = 0;
            await OpenConnectionAsync();

            using (var transaction = _dbConnection.BeginTransaction())
            {
                try
                {

                    //1. Ánh xạ giá trị id
                    var keyName = _modelType.GetKeyName();
                    entity.GetType().GetProperty(keyName).SetValue(entity, entityId);

                    //2. Duyệt các thuộc tính trên customer và tạo parameters
                    var parameters = MappingDbType(entity);

                    //3. Kết nối tới CSDL:
                    rowAffects = await _dbConnection.ExecuteAsync($"Proc_Update{_modelType.Name}", param: parameters, transaction: transaction, commandType: CommandType.StoredProcedure);

                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }
            }
            //4. Trả về dữ liệu
            return rowAffects;
        }

        /// <summary>
        /// Lấy danh sách thực thể paging
        /// </summary>
        /// <param name="pageSize">Số bản ghi mỗi trang</param>
        /// <param name="pageIndex">Chỉ số trang</param>
        /// <param name="search">Từ khóa tìm kiếm</param>
        /// <param name="searchFields">Danh sách trường tìm kiếm</param>
        /// <param name="sort">Sắp xếp theo</param>
        /// <returns>Tổng số bản ghi và danh sách dữ liệu</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<PagingResponse<TEntity>> GetFilterPagingAsync(
            int pageSize,
            int pageIndex,
            string search,
            List<string> searchFields,
            string sort)
        {
            long total = 0;
            var data = Enumerable.Empty<TEntity>();

            await OpenConnectionAsync();

            string store = string.Format("Proc_{0}_FilterPaging", _modelType.Name);

            var parameters = new DynamicParameters();
            parameters.Add("@v_pageIndex", pageIndex);
            parameters.Add("@v_pageSize", pageSize);
            parameters.Add("@v_search", search);
            parameters.Add("@v_sort", NormalizeSort(sort));
            parameters.Add("@v_searchFields", JsonSerializer.Serialize(NormalizeFieldNames(searchFields)));

            using var reader = await _dbConnection.QueryMultipleAsync(
                new CommandDefinition(store, parameters, commandType: CommandType.StoredProcedure));

            data = (await reader.ReadAsync<TEntity>()).ToList();

            total = await reader.ReadFirstAsync<long>();

            return new PagingResponse<TEntity>
            {
                Total = total,
                PageSize = pageSize,
                PageIndex = pageIndex,
                Data = data.ToList()
            };
        }

        /// <summary>
        /// Ánh xạ các thuộc tính sang kiểu dynamic
        /// </summary>
        /// <param name="entity">Thực thể</param>
        /// <returns>Dan sách các biến động</returns>
        private DynamicParameters MappingDbType(TEntity entity)
        {
            var parameters = new DynamicParameters();
            try
            {
                //1. Duyệt các thuộc tính trên entity và tạo parameters
                var properties = entity.GetType().GetProperties().Where(IsDatabaseColumn);

                foreach (var property in properties)
                {
                    var propertyName = property.Name;
                    var propertyValue = property.GetValue(entity);
                    var propertyType = property.PropertyType;

                    if (propertyType == typeof(Guid) || propertyType == typeof(Guid?))
                        parameters.Add($"@v_{propertyName}", propertyValue, DbType.String);
                    else
                        parameters.Add($"@v_{propertyName}", propertyValue);
                }
            }
            catch (Exception ex)
            {
                // Log error but continue with empty parameters
                Console.WriteLine($"Error mapping entity properties: {ex.Message}");
            }
            //2. Trả về danh sách các parameter
            return parameters;
        }

        /// <summary>
        /// Chuẩn hóa chuỗi sắp xếp từ PascalCase sang snake_case
        /// </summary>
        /// <param name="sort">
        /// Chuỗi sắp xếp, hỗ trợ nhiều trường phân tách bởi dấu phẩy.
        /// Thêm dấu '-' phía trước tên trường để sắp xếp giảm dần.
        /// </param>
        /// <returns>Chuỗi sắp xếp đã được chuyển sang snake_case</returns>
        /// CREATED BY: VVHung (04/06/2026)
        protected static string NormalizeSort(string? sort)
        {
            if (string.IsNullOrWhiteSpace(sort))
            {
                return string.Empty;
            }

            var fields = sort
                .Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)
                .Select(item =>
                {
                    var isDescending = item.StartsWith("-");
                    var fieldName = isDescending ? item[1..] : item;
                    var normalized = ToSnakeCase(fieldName);
                    return isDescending ? $"-{normalized}" : normalized;
                });

            return string.Join(",", fields);
        }

        /// <summary>
        /// Chuẩn hóa danh sách tên trường từ PascalCase sang snake_case
        /// </summary>
        /// <param name="fieldNames">Danh sách tên trường cần chuẩn hóa</param>
        /// <returns>Danh sách tên trường đã được chuyển sang snake_case</returns>
        /// CREATED BY: VVHung (04/06/2026)
        protected static List<string> NormalizeFieldNames(IEnumerable<string>? fieldNames)
        {
            if (fieldNames == null)
            {
                return new List<string>();
            }

            return fieldNames
                .Where(field => !string.IsNullOrWhiteSpace(field))
                .Select(field => ToSnakeCase(field.Trim()))
                .ToList();
        }

        /// <summary>
        /// Chuyển tên thuộc tính từ PascalCase hoặc CamelCase sang snake_case
        /// </summary>
        /// <param name="value">Tên thuộc tính cần chuyển đổi</param>
        /// <returns>Chuỗi theo định dạng snake_case</returns>
        /// CREATED BY: VVHung (04/06/2026)
        protected static string ToSnakeCase(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
            {
                return value;
            }

            value = value
                .Replace("IDs", "Ids")
                .Replace("ID", "Id");

            var builder = new StringBuilder(value.Length + 8);

            for (var index = 0; index < value.Length; index++)
            {
                var current = value[index];

                if (char.IsUpper(current))
                {
                    var hasPrevious = index > 0;
                    var nextIsLower = index + 1 < value.Length && char.IsLower(value[index + 1]);
                    var previousIsLowerOrDigit = hasPrevious && (char.IsLower(value[index - 1]) || char.IsDigit(value[index - 1]));
                    var previousIsUpper = hasPrevious && char.IsUpper(value[index - 1]);

                    if (hasPrevious && (previousIsLowerOrDigit || (previousIsUpper && nextIsLower)))
                    {
                        builder.Append('_');
                    }

                    builder.Append(char.ToLowerInvariant(current));
                }
                else
                {
                    builder.Append(current);
                }
            }

            return builder.ToString();
        }

        /// <summary>
        /// Sinh danh sách cột SELECT dựa trên các thuộc tính của thực thể
        /// </summary>
        /// <returns>
        /// Chuỗi danh sách cột theo định dạng:
        /// column_name AS PropertyName
        /// </returns>
        /// CREATED BY: VVHung (04/06/2026)
        private string GetSelectColumns()
        {
            var columns = _modelType
                .GetProperties()
                .Where(IsDatabaseColumn)
                .Select(property => $"{ToSnakeCase(property.Name)} AS {property.Name}");

            return string.Join(", ", columns);
        }

        /// <summary>
        /// Kiểm tra thuộc tính có được ánh xạ xuống cơ sở dữ liệu hay không
        /// </summary>
        /// <param name="property">Thông tin thuộc tính cần kiểm tra</param>
        /// <returns>
        /// True nếu thuộc tính được ánh xạ xuống database,
        /// ngược lại trả về False
        /// </returns>
        /// CREATED BY: VVHung (04/06/2026)
        private bool IsDatabaseColumn(PropertyInfo property)
        {
            if (property.Name == nameof(BaseModel.State))
            {
                return false;
            }

            if (property.IsDefined(typeof(NotMappedAttribute), false))
            {
                return false;
            }

            if (property.Name is nameof(BaseModel.CreatedBy)
                or nameof(BaseModel.ModifiedBy)
                or nameof(BaseModel.ModifiedDate))
            {
                return false;
            }

            if (property.Name == nameof(BaseModel.IsDeleted))
            {
                return _modelType.GetHasDeletedColumn();
            }

            return true;
        }

        #endregion
    }
}
