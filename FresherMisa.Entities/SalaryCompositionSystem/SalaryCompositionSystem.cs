using FresherMisa.Entities.Enums;
using FresherMisa.Entities.Extensions;
using System.ComponentModel.DataAnnotations;

namespace FresherMisa.Entities.SalaryCompositionSystem
{
    [ConfigTable("pa_salary_composition_system", false, "SalaryCompositionCode")]
    public class SalaryCompositionSystem : BaseModel
    {
        [Key]
        public Guid SalaryCompositionSystemID { get; set; }

        public string? SalaryCompositionCode { get; set; }

        public string? SalaryCompositionName { get; set; }

        public SalaryCompositionType? SalaryCompositionType { get; set; }

        public Nature? Nature { get; set; }

        public TaxType? TaxType { get; set; }

        public bool? IsTaxReduction { get; set; }

        public string? NormFormula { get; set; }

        public bool? AllowOverNorm { get; set; }

        public SalaryValueType? ValueType { get; set; }

        public string? ValueFormula { get; set; }

        public string? Description { get; set; }

        public PayslipDisplayType? PayslipDisplayType { get; set; }
    }
}