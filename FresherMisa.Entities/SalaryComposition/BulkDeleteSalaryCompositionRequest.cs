using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.SalaryComposition
{
    public class BulkDeleteSalaryCompositionRequest
    {
        /// <summary>
        /// Danh sách ID thành phần lương cần xóa.
        /// </summary>
        public List<Guid> Ids { get; set; } = new();
    }
}
