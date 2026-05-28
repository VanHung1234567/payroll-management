using FresherMisa.Entities.Extensions;
using System.ComponentModel.DataAnnotations;

namespace FresherMisa.Entities.GridConfig
{
    [ConfigTable("pa_grid_config", false)]
    public class GridConfig : BaseModel
    {
        [Key]
        public Guid GridConfigID { get; set; }

        public string? GridKey { get; set; }

        public string? FieldName { get; set; }

        public string? Caption { get; set; }

        public int? Width { get; set; }

        public bool? Visible { get; set; }

        public bool? IsFixed { get; set; }

        public string? FixedPosition { get; set; }

        public bool? AllowSorting { get; set; }

        public int? SortOrder { get; set; }

    }
}