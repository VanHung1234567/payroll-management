using FresherMisa.Entities.Enums;

namespace FresherMisa.Entities.SalaryCompositionSystem
{
    public class SalaryCompositionSystemFilterRequest : PagingRequest
    {
        public SalaryCompositionType? SalaryCompositionType { get; set; }
    }
}