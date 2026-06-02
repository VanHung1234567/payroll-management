using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.SalaryComposition
{
    public class CopySystemToSalaryRequest
    {
        public List<Guid> SalaryCompositionSystemIDs { get; set; } = new();
    }
}
