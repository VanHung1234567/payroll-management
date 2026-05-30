using FresherMisa.Entities.Enums;
using FresherMisa.Entities.Extensions;
using System.ComponentModel.DataAnnotations;

namespace FresherMisa.Entities.SalaryComposition
{
    [ConfigTable("pa_salary_composition", false, "SalaryCompositionCode")]
    public class SalaryComposition : BaseModel
    {
        [Key]
        public Guid SalaryCompositionID { get; set; }

        public string? SalaryCompositionCode { get; set; }

        public string? SalaryCompositionName { get; set; }

        public string? OrganizationIDs { get; set; }

        public string? OrganizationNames { get; set; }

        public Guid SalaryCompositionTypeID { get; set; }

        public string? TypeName { get; set; }

        public Nature? Nature { get; set; }

        public TaxType? TaxType { get; set; }

        public bool? IsTaxReduction { get; set; }

        public string? NormFormula { get; set; }

        public bool? AllowOverNorm { get; set; }

        public SalaryValueType? ValueType { get; set; }

        public string? ValueFormula { get; set; }

        public string? Description { get; set; }

        public PayslipDisplayType? PayslipDisplayType { get; set; }

        public CreatedSource? CreatedSource { get; set; }

        public Status? Status { get; set; }

    }
}