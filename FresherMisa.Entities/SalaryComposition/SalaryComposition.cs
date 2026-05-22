using FresherMisa.Entities.Extensions;
using System.ComponentModel.DataAnnotations;

namespace FresherMisa.Entities.SalaryComposition
{
    [ConfigTable("pa_salary_composition", false, "SalaryCompositionCode")]
    public class SalaryComposition : BaseModel
    {
        [Key]
        public Guid SalaryCompositionID { get; set; }

        public string SalaryCompositionCode { get; set; }

        public string SalaryCompositionName { get; set; }

        public Guid OrganizationID { get; set; }

        public Guid SalaryCompositionTypeID { get; set; }

        public int Nature { get; set; }

        public int TaxType { get; set; }

        public bool IsTaxReduction { get; set; }

        public string NormFormula { get; set; }

        public bool AllowOverNorm { get; set; }

        public int ValueType { get; set; }

        public string ValueFormula { get; set; }

        public string Description { get; set; }

        public int PayslipDisplayType { get; set; }

        public int CreatedSource { get; set; }

        public int Status { get; set; }

        public DateTime CreatedDate { get; set; }
    }
}