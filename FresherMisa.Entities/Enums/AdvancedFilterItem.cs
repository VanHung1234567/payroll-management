using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.Enums
{
    public class AdvancedFilterItem
    {
        /// <summary>
        /// Tên trường cần lọc.
        /// </summary>
        public string FieldName { get; set; } = string.Empty;

        /// <summary>
        /// Toán tử lọc.
        /// </summary>
        public string Operator { get; set; } = string.Empty;

        /// <summary>
        /// Giá trị lọc.
        /// </summary>
        public string? Value { get; set; }
    }
}
