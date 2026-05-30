namespace FresherMisa.Entities.SalaryCompositionSystem
{
    public class SalaryCompositionSystemFilterRequest : PagingRequest
    {
        public Guid? SalaryCompositionTypeID { get; set; }
    }
}