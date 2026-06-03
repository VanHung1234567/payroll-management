using FresherMisa.Entities.Extensions;
using System.ComponentModel.DataAnnotations;

namespace FresherMisa.Entities.GridConfig
{
    [ConfigTable("pa_grid_config", false)]
    public class GridConfig : BaseModel
    {
        /// <summary>
        /// ID cấu hình cột.
        /// </summary>
        [Key]
        public Guid GridConfigID { get; set; }

        /// <summary>
        /// Mã định danh của grid.
        /// </summary>
        public string? GridKey { get; set; }

        /// <summary>
        /// Tên trường dữ liệu.
        /// </summary>
        public string? FieldName { get; set; }

        /// <summary>
        /// Tiêu đề hiển thị.
        /// </summary>
        public string? Caption { get; set; }

        /// <summary>
        /// Độ rộng cột.
        /// </summary>
        public int? Width { get; set; }

        /// <summary>
        /// True nếu cột được hiển thị.
        /// </summary>
        public bool? Visible { get; set; }

        /// <summary>
        /// True nếu cột được cố định.
        /// </summary>
        public bool? IsFixed { get; set; }

        /// <summary>
        /// Vị trí cố định của cột.
        /// </summary>
        public string? FixedPosition { get; set; }

        /// <summary>
        /// True nếu cho phép sắp xếp.
        /// </summary>
        public bool? AllowSorting { get; set; }

        /// <summary>
        /// Thứ tự hiển thị.
        /// </summary>
        public int? SortOrder { get; set; }

    }
}