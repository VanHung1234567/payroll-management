using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json.Serialization;

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
        [JsonConverter(typeof(JsonStringEnumConverter<FilterOperator>))]
        public FilterOperator Operator { get; set; } = FilterOperator.Contains;

        /// <summary>
        /// Giá trị lọc.
        /// </summary>
        public string? Value { get; set; }
    }
}
