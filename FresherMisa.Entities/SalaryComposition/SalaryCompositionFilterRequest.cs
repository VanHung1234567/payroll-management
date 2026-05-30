namespace FresherMisa.Entities.SalaryComposition
{
    public class SalaryCompositionFilterRequest : PagingRequest
    {
        public int? Status { get; set; }

        public string? OrganizationIDs { get; set; }
    }
}