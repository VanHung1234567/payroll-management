using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.GridConfig
{
    public class SaveGridConfigRequest
    {
        public string GridKey { get; set; } = string.Empty;

        public List<GridColumnConfigRequest> Columns { get; set; } = new();
    }
}
