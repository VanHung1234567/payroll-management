using FresherMisa.Entities.Extensions;
using System.ComponentModel.DataAnnotations;

namespace FresherMisa.Entities.Organization
{
    [ConfigTable("pa_organization", false, "OrganizationCode")]
    public class Organization : BaseModel
    {
        [Key]
        public Guid OrganizationID { get; set; }

        public string? OrganizationCode { get; set; }

        public string? OrganizationName { get; set; }

        public Guid? ParentID { get; set; }

        public int? SortOrder { get; set; }
    }
}