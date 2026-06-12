using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.Enums
{
    /// <summary>
    /// Kết quả chuẩn hóa input truy vấn.
    /// Dùng chung cho các hàm kiểm tra sort, search field, advanced filter field và danh sách Guid.
    /// </summary>
    /// CREATED BY: VVHung (11/06/2026)
    public class QueryNormalizeResult
    {
        /// <summary>
        /// True nếu dữ liệu hợp lệ, False nếu có lỗi validate.
        /// </summary>
        public bool IsValid { get; set; } = true;

        /// <summary>
        /// Thông báo lỗi nếu dữ liệu không hợp lệ.
        /// </summary>
        public string Error { get; set; } = string.Empty;

        /// <summary>
        /// Danh sách field tìm kiếm đã được whitelist.
        /// </summary>
        public List<string> SearchFields { get; set; } = new();

        /// <summary>
        /// Chuỗi sort đã được whitelist.
        /// </summary>
        public string Sort { get; set; } = string.Empty;

        /// <summary>
        /// Giá trị đã chuẩn hóa, dùng cho các hàm trả về một chuỗi kết quả như danh sách Guid.
        /// </summary>
        public string Value { get; set; } = string.Empty;
    }
}
