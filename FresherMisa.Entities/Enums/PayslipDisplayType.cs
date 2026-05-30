using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.Enums
{
    public enum PayslipDisplayType
    {
        /// <summary>
        /// Có
        /// </summary>
        Show = 1,

        /// <summary>
        /// Không
        /// </summary>
        Hide = 2,

        /// <summary>
        /// Chỉ hiển thị nếu giá trị khác 0
        /// </summary>
        ShowIfNotZero = 3
    }
}
