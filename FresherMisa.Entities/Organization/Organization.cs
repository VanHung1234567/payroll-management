using FresherMisa.Entities.Extensions;
using System.ComponentModel.DataAnnotations;

namespace FresherMisa.Entities.Organization
{
    [ConfigTable("pa_organization", false, "OrganizationCode")]
    public class Organization : BaseModel
    {
        /// <summary>
        /// ID đơn vị.
        /// </summary>
        [Key]
        public Guid OrganizationID { get; set; }

        /// <summary>
        /// Mã đơn vị.
        /// </summary>
        public string? OrganizationCode { get; set; }

        /// <summary>
        /// Tên đơn vị.
        /// </summary>
        public string? OrganizationName { get; set; }

        /// <summary>
        /// ID đơn vị cha.
        /// </summary>
        public Guid? ParentID { get; set; }

        /// <summary>
        /// Thứ tự hiển thị.
        /// </summary>
        public int? SortOrder { get; set; }
    }
}