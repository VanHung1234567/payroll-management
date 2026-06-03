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

        [Required(ErrorMessage = "Mã TPL không được để trống")]
        [MaxLength(255, ErrorMessage = "Mã TPL tối đa 255 ký tự")]
        public string? SalaryCompositionCode { get; set; }

        [Required(ErrorMessage = "Tên TPL không được để trống")]
        [MaxLength(255, ErrorMessage = "Tên TPL tối đa 255 ký tự")]
        public string? SalaryCompositionName { get; set; }

        [Required(ErrorMessage = "Đơn vị áp dụng không được để trống")]
        public string? OrganizationIDs { get; set; }

        public string? OrganizationNames { get; set; }

        [Required(ErrorMessage = "Loại thành phần không được để trống")]
        public SalaryCompositionType? SalaryCompositionType { get; set; }

        [Required(ErrorMessage = "Tính chất không được để trống")]
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