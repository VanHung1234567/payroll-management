using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities
{
    public class PagingResponse<T>
    {
        public long Total { get; set; }

        public List<T> Data { get; set; }
    }
}
