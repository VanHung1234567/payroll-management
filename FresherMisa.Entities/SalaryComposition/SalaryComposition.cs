using FresherMisa.Entities.Enums;
using FresherMisa.Entities.Extensions;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FresherMisa.Entities.SalaryComposition
{
    [ConfigTable("pa_salary_composition", false, "SalaryCompositionCode")]
    public class SalaryComposition : BaseModel
    {
        /// <summary>
        /// ID thành phần lương.
        /// </summary>
        [Key]
        public Guid SalaryCompositionID { get; set; }

        /// <summary>
        /// Mã thành phần lương.
        /// </summary>
        [Required(ErrorMessage = "Mã TPL không được để trống")]
        [MaxLength(255, ErrorMessage = "Mã TPL tối đa 255 ký tự")]
        public string? SalaryCompositionCode { get; set; }

        /// <summary>
        /// Tên thành phần lương.
        /// </summary>
        [Required(ErrorMessage = "Tên TPL không được để trống")]
        [MaxLength(255, ErrorMessage = "Tên TPL tối đa 255 ký tự")]
        public string? SalaryCompositionName { get; set; }

        /// <summary>
        /// Danh sách ID đơn vị áp dụng.
        /// </summary>
        [NotMapped]
        [Required(ErrorMessage = "Đơn vị áp dụng không được để trống")]
        public string? OrganizationIDs { get; set; }

        /// <summary>
        /// Danh sách tên đơn vị áp dụng.
        /// </summary>
        [NotMapped]
        public string? OrganizationNames { get; set; }

        /// <summary>
        /// Loại thành phần lương.
        /// </summary>
        [Required(ErrorMessage = "Loại thành phần không được để trống")]
        public SalaryCompositionType? SalaryCompositionType { get; set; }

        /// <summary>
        /// Tính chất thành phần lương.
        /// </summary>
        [Required(ErrorMessage = "Tính chất không được để trống")]
        public Nature? Nature { get; set; }

        /// <summary>
        /// Loại thuế.
        /// </summary>
        public TaxType? TaxType { get; set; }

        /// <summary>
        /// True nếu được giảm trừ thuế.
        /// </summary>
        public bool? IsTaxReduction { get; set; }

        /// <summary>
        /// Công thức định mức.
        /// </summary>
        public string? NormFormula { get; set; }

        /// <summary>
        /// True nếu cho phép vượt định mức.
        /// </summary>
        public bool? AllowOverNorm { get; set; }

        /// <summary>
        /// Kiểu giá trị.
        /// </summary>
        public SalaryValueType? ValueType { get; set; }

        /// <summary>
        /// Giá trị hoặc công thức.
        /// </summary>
        public string? ValueFormula { get; set; }

        /// <summary>
        /// Mô tả.
        /// </summary>
        public string? Description { get; set; }

        /// <summary>
        /// Kiểu hiển thị trên phiếu lương.
        /// </summary>
        public PayslipDisplayType? PayslipDisplayType { get; set; }

        /// <summary>
        /// Nguồn tạo dữ liệu.
        /// </summary>
        public CreatedSource? CreatedSource { get; set; }

        /// <summary>
        /// Trạng thái theo dõi.
        /// </summary>
        public Status? Status { get; set; }

    }
}