using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.Enums
{
    public enum SalaryValueType
    {
        /// <summary>
        /// Số
        /// </summary>
         Number = 1,


        /// <summary>
        /// Tiền tệ
        /// </summary>
        Currency = 2,

        /// <summary>
        /// Phần trăm
        /// </summary>
        Percent = 3,

        /// <summary>
        /// Chữ
        /// </summary>
        Text = 4,

        /// <summary>
        /// Ngày
        /// </summary>
        Data = 5
    }
}
