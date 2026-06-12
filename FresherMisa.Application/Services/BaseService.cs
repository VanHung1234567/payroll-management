using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Helpers;
using FresherMisa.Entities;
using FresherMisa.Entities.Enums;
using FresherMisa.Entities.Extensions;
using System.Collections.Concurrent;
using System.ComponentModel.DataAnnotations;
using System.Reflection;

namespace FresherMisa.Application.Services
{
    /// <summary>
    /// Service dùng chung
    /// </summary>
    /// <typeparam name="TEntity">Loại thực thể</typeparam>
    /// CREATED BY: VVHung (29/05/2026)
    public class BaseService<TEntity> : IBaseService<TEntity> where TEntity : BaseModel
    {
        #region Declare
        protected readonly IBaseRepository<TEntity> _baseRepository;
        private readonly string _tableName;
        private static readonly ConcurrentDictionary<Type, PropertyInfo[]> _cachedProperties = new();
        private const string SearchFieldSeparator = ";";
        #endregion

        #region Constructer
        public BaseService(IBaseRepository<TEntity> baseRepository)
        {
            _baseRepository = baseRepository;
            _tableName = typeof(TEntity).GetTableName().ToLowerInvariant();
        }
        #endregion

        #region Protected Helpers - có thể override trong derived class
        protected static ServiceResponse CreateSuccessResponse(object? data = null) => new()
        {
            IsSuccess = true,
            Code = (int)ResponseCode.Success,
            Data = data
        };

        protected static ServiceResponse CreateErrorResponse(ResponseCode code, string devMessage, string? userMessage = null) => new()
        {
            IsSuccess = false,
            Code = (int)code,
            DevMessage = devMessage,
            Data = userMessage
        };

        #endregion

        #region Methods
        /// <summary>
        /// Lấy tất cả bản ghi
        /// </summary>
        /// <returns>Danh sách bản ghi</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<ServiceResponse> GetEntitiesAsync()
        {
            var entities = await _baseRepository.GetEntitiesAsync();
            return CreateSuccessResponse(entities.Cast<TEntity>().ToList());
        }

        /// <summary>
        /// Lấy bản ghi theo Id
        /// </summary>
        /// <param name="entityId">Id của bản ghi</param>
        /// <returns>Bản ghi duy nhất</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<ServiceResponse> GetEntityByIDAsync(Guid entityId)
        {
            if (entityId == Guid.Empty)
            {
                return CreateErrorResponse(ResponseCode.BadRequest, "Id không hợp lệ");
            }

            var entity = await _baseRepository.GetEntityByIDAsync(entityId);
            return entity != null
                ? CreateSuccessResponse(entity)
                : CreateErrorResponse(ResponseCode.NotFound, "Không tìm thấy bản ghi");
        }

        /// <summary>
        /// Xóa bản ghi
        /// </summary>
        /// <param name="entityId">Id của bản ghi</param>
        /// <returns>Số dòng bị xóa</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<ServiceResponse> DeleteByIDAsync(Guid entityId)
        {
            if (entityId == Guid.Empty)
            {
                return CreateErrorResponse(ResponseCode.BadRequest, "Id không hợp lệ");
            }

            //1. Validate xóa
            bool canDelete = await ValidateBeforeDeleteAsync(entityId);
            if (!canDelete)
            {
                return CreateErrorResponse(ResponseCode.BadRequest, "Không thể xóa bản ghi này");
            }

            //2. Thực hiện xóa
            int rowAffects = await _baseRepository.DeleteAsync(entityId);

            if (rowAffects > 0)
            {
                //3. Xóa thành công thì làm gì
                AfterDelete();
                return CreateSuccessResponse(rowAffects);
            }

            return CreateErrorResponse(ResponseCode.NotFound, "Không tìm thấy bản ghi để xóa");
        }

        /// <summary>
        /// Thêm một thực thể
        /// </summary>
        /// <param name="entity">Thực thể cần thêm</param>
        /// <returns>ServiceResponse chứa kết quả</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<ServiceResponse> InsertAsync(TEntity entity)
        {
            entity.State = ModelSate.Add;

            AutoGeneratePrimaryKey(entity);
            var result = await _baseRepository.InsertAsync(entity);
            return CreateSuccessResponse(result);
        }

        /// <summary>
        /// Cập nhập thông tin bản ghi 
        /// </summary>
        /// <param name="entityId">Id bản ghi</param>
        /// <param name="entity">Thông tin bản ghi</param>
        /// <returns>ServiceResponse chứa kết quả</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<ServiceResponse> UpdateAsync(Guid entityId, TEntity entity)
        {
            if (entityId == Guid.Empty)
            {
                return CreateErrorResponse(ResponseCode.BadRequest, "Id không hợp lệ");
            }
            int rowAffects = await _baseRepository.UpdateAsync(entityId, entity);
            if (rowAffects > 0)
            {
                return CreateSuccessResponse(rowAffects);
            }
            return CreateErrorResponse(ResponseCode.NotFound, "Không tìm thấy bản ghi để cập nhật");
        }

        /// <summary>
        /// Lấy danh sách thực thể paging
        /// </summary>
        /// <param name="pagingRequest">Thông tin phân trang</param>
        /// <returns>Danh sách thực thể phân trang</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<ServiceResponse> GetFilterPagingAsync(PagingRequest pagingRequest)
        {
            if (!QueryInputNormalizer.TryNormalizePaging<TEntity>(
                    pagingRequest,
                    out var fields,
                    out var sort,
                    out var error))
            {
                return CreateErrorResponse(ResponseCode.BadRequest, error ?? "Điều kiện lọc không hợp lệ");
            }

             var response = await _baseRepository.GetFilterPagingAsync(
                    pagingRequest.PageSize,
                    pagingRequest.PageIndex,
                    pagingRequest.Search,
                    fields,
                    sort
              );

                return CreateSuccessResponse(response);
         }

        private void AutoGeneratePrimaryKey(TEntity entity)
        {
            var keyProperty = typeof(TEntity)
                .GetProperties()
                .FirstOrDefault(p => Attribute.IsDefined(p, typeof(KeyAttribute)));

            if (keyProperty == null)
            {
                return;
            }

            if (keyProperty.PropertyType == typeof(Guid))
            {
                var currentValue = (Guid)keyProperty.GetValue(entity)!;

                if (currentValue == Guid.Empty)
                {
                    keyProperty.SetValue(entity, Guid.NewGuid());
                }
            }

            if (keyProperty.PropertyType == typeof(Guid?))
            {
                var currentValue = (Guid?)keyProperty.GetValue(entity);

                if (currentValue == null || currentValue == Guid.Empty)
                {
                    keyProperty.SetValue(entity, Guid.NewGuid());
                }
            }
        }
        #endregion

        #region Virtual method - Lifecycle hooks
        /// <summary>
        /// Trước khi lấy danh sách entity
        /// </summary>
        protected virtual void OnBeforeGetEntities() { }

        /// <summary>
        /// Sau khi lấy danh sách entity
        /// </summary>
        /// <param name="entities">Danh sách entity</param>
        protected virtual void OnAfterGetEntities(IEnumerable<TEntity> entities) { }

        /// <summary>
        /// Trước khi lấy entity theo Id
        /// </summary>
        /// <param name="entityId">Id entity</param>
        protected virtual void OnBeforeGetById(Guid entityId) { }

        /// <summary>
        /// Sau khi lấy entity theo Id
        /// </summary>
        /// <param name="entity">Entity lấy được</param>
        protected virtual void OnAfterGetById(TEntity? entity) { }

        /// <summary>
        /// Trước khi thêm mới entity
        /// </summary>
        /// <param name="entity">Entity cần thêm</param>
        protected virtual void OnBeforeInsert(TEntity entity) { }

        /// <summary>
        /// Sau khi thêm mới entity
        /// </summary>
        /// <param name="entity">Entity đã thêm</param>
        /// <param name="result">Kết quả</param>
        protected virtual void OnAfterInsert(TEntity entity, int result) { }

        /// <summary>
        /// Trước khi cập nhật entity
        /// </summary>
        /// <param name="entityId">Id entity</param>
        /// <param name="entity">Entity cập nhật</param>
        protected virtual void OnBeforeUpdate(Guid entityId, TEntity entity) { }

        /// <summary>
        /// Sau khi cập nhật entity
        /// </summary>
        /// <param name="entityId">Id entity</param>
        /// <param name="entity">Entity đã cập nhật</param>
        /// <param name="result">Kết quả</param>
        protected virtual void OnAfterUpdate(Guid entityId, TEntity entity, int result) { }

        /// <summary>
        /// Trước khi xóa entity
        /// </summary>
        /// <param name="entityId">Id entity</param>
        protected virtual void OnBeforeDelete(Guid entityId) { }

        /// <summary>
        /// Sau khi xóa entity
        /// </summary>
        /// <param name="entityId">Id entity</param>
        /// <param name="result">Kết quả</param>
        protected virtual void OnAfterDelete(Guid entityId, int result) { }

        /// <summary>
        /// Trước khi lấy danh sách phân trang
        /// </summary>
        /// <param name="pagingRequest">Thông tin phân trang</param>
        protected virtual void OnBeforeGetFilterPaging(PagingRequest pagingRequest) { }

        /// <summary>
        /// Sau khi lấy danh sách phân trang
        /// </summary>
        /// <param name="response">Kết quả phân trang</param>
        protected virtual void OnAfterGetFilterPaging(PagingResponse<TEntity> response) { }

        /// <summary>
        /// Khi validation thất bại
        /// </summary>
        /// <param name="errors">Danh sách lỗi</param>
        protected virtual void OnValidationFailed(List<ValidationError> errors) { }

        #endregion

        #region Virtual method - Override methods
        /// <summary>
        /// Xóa thành công
        /// </summary>
        protected virtual void AfterDelete()
        {
        }

        /// <summary>
        /// Trước khi xóa
        /// </summary>
        /// <param name="entityId">Id bản ghi cần xóa</param>
        /// <returns>Có thể xóa hay không</returns>
        protected virtual Task<bool> ValidateBeforeDeleteAsync(Guid entityId)
        {
            return Task.FromResult(true);
        }
        #endregion
    }

    /// <summary>
    /// Lỗi validate
    /// </summary>
    /// <param name="Field">Tên trường</param>
    /// <param name="Message">Thông báo lỗi</param>
    public record ValidationError(string Field, string Message);

    
}
