using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.GridConfig
{
    public class GridColumnConfigRequest
    {
        public string FieldName { get; set; } = string.Empty;

        public bool Visible { get; set; }

        public int SortOrder { get; set; }
    }
}
