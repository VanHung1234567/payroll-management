using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities
{
    public class PagingRequest
    {
        public int PageIndex { get; set; } = 1;

        public int PageSize { get; set; } = 15;

        public string? Search { get; set; }

        public string? Sort { get; set; }

        /// <summary>
        /// DepartmentCode;DepartmentName
        /// </summary>
        public string? SearchFields { get; set; }
    }

}
