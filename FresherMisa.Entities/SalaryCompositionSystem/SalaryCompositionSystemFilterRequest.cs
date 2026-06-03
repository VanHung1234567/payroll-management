using FresherMisa.Entities.Enums;

namespace FresherMisa.Entities.SalaryCompositionSystem
{
    public class SalaryCompositionSystemFilterRequest : PagingRequest
    {
        /// <summary>
        /// Loại thành phần lương.
        /// </summary>
        public SalaryCompositionType? SalaryCompositionType { get; set; }
    }
}