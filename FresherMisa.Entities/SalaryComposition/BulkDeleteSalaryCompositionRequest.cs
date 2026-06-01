using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.SalaryComposition
{
    public class BulkDeleteSalaryCompositionRequest
    {
        public List<Guid> Ids { get; set; } = new();
    }
}
