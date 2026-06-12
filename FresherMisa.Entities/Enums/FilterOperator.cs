using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.Enums
{
    public enum FilterOperator
    {
        /// <summary>
        /// Chứa
        /// </summary>
        Contains = 1,

        /// <summary>
        /// Không chứa
        /// </summary>
        NotContains = 2,

        /// <summary>
        /// Bằng
        /// </summary>
        Equals = 3,

        /// <summary>
        /// Không bằng
        /// </summary>
        NotEquals = 4,

        /// <summary>
        /// Bắt đầu bằng
        /// </summary>
        StartsWith = 5,

        /// <summary>
        /// Kết thúc bằng
        /// </summary>
        EndsWith = 6,

        /// <summary>
        /// Trống
        /// </summary>
        Empty = 7,

        /// <summary>
        /// Không trống
        /// </summary>
        NotEmpty = 8
    }
}
