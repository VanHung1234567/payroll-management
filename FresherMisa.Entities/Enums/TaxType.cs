using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.Enums
{
    public enum TaxType
    {
        /// <summary>
        /// Chịu thuế
        /// </summary>
        Taxable = 1,

        /// <summary>
        /// Miễn thuế toàn phần
        /// </summary>
        FullExempt = 2,

        /// <summary>
        /// Miễn thuế một phần
        /// </summary>
        PartialExempt = 3
    }
}
