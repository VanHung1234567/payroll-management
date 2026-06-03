using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.SalaryComposition
{
    public class BulkUpdateSalaryStatusRequest
    {
        /// <summary>
        /// Danh sách ID thành phần lương.
        /// </summary>
        public List<Guid> Ids { get; set; } = new();

        /// <summary>
        /// Trạng thái cần cập nhật.
        /// 1 - Đang theo dõi.
        /// 0 - Ngừng theo dõi.
        /// </summary>
        public int Status { get; set; }
    }
}
