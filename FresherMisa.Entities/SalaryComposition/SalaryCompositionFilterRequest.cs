using FresherMisa.Entities.Enums;

namespace FresherMisa.Entities.SalaryComposition
{
    public class SalaryCompositionFilterRequest : PagingRequest
    {
        /// <summary>
        /// Trạng thái theo dõi.
        /// </summary>
        public int? Status { get; set; }

        /// <summary>
        /// Danh sách ID đơn vị áp dụng.
        /// </summary>
        public string? OrganizationIDs { get; set; }

        /// <summary>
        /// Danh sách điều kiện lọc nâng cao.
        /// </summary>
        public List<AdvancedFilterItem> AdvancedFilters { get; set; } = new();
    }
}