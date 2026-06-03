using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.SalaryComposition
{
    public class CopySystemToSalaryRequest
    {
        /// <summary>
        /// Danh sách ID thành phần lương hệ thống.
        /// </summary>
        public List<Guid> SalaryCompositionSystemIDs { get; set; } = new();
    }
}
