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

        public Guid SalaryCompositionTypeID { get; set; }

        public string? TypeName { get; set; }

        public int? Nature { get; set; }

        public int? TaxType { get; set; }

        public bool? IsTaxReduction { get; set; }

        public string? NormFormula { get; set; }

        public bool? AllowOverNorm { get; set; }

        public int? ValueType { get; set; }

        public string? ValueFormula { get; set; }

        public string? Description { get; set; }

        public int? PayslipDisplayType { get; set; }
    }
}