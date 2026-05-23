using FresherMisa.Entities.Extensions;
using System.ComponentModel.DataAnnotations;

namespace FresherMisa.Entities.SalaryCompositionType
{
    [ConfigTable("pa_salary_composition_type", false, "TypeCode")]
    public class SalaryCompositionType : BaseModel
    {
        [Key]
        public Guid SalaryCompositionTypeID { get; set; }

        public string? TypeCode { get; set; }

        public string? TypeName { get; set; }

        public int? SortOrder { get; set; }
    }
}