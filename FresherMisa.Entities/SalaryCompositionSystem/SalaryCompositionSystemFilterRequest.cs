using FresherMisa.Entities.Enums;

namespace FresherMisa.Entities.SalaryCompositionSystem
{
    public class SalaryCompositionSystemFilterRequest : PagingRequest
    {
        /// <summary>
        /// Loại thành phần lương.
        /// </summary>
        public SalaryCompositionType? SalaryCompositionType { get; set; }

        /// <summary>
        /// Danh sách điều kiện lọc nâng cao.
        /// </summary>
        public List<AdvancedFilterItem> AdvancedFilters { get; set; } = new();
    }
}