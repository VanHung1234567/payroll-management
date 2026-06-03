using FresherMisa.Entities.Enums;
using FresherMisa.Entities.Extensions;
using System.ComponentModel.DataAnnotations;

namespace FresherMisa.Entities.SalaryCompositionSystem
{
    [ConfigTable("pa_salary_composition_system", false, "SalaryCompositionCode")]
    public class SalaryCompositionSystem : BaseModel
    {
        /// <summary>
        /// ID thành phần lương hệ thống.
        /// </summary>
        [Key]
        public Guid SalaryCompositionSystemID { get; set; }

        /// <summary>
        /// Mã thành phần lương.
        /// </summary>
        public string? SalaryCompositionCode { get; set; }

        /// <summary>
        /// Tên thành phần lương.
        /// </summary>
        public string? SalaryCompositionName { get; set; }

        /// <summary>
        /// Loại thành phần lương.
        /// </summary>
        public SalaryCompositionType? SalaryCompositionType { get; set; }

        /// <summary>
        /// Tính chất thành phần lương.
        /// </summary>
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
    }
}