using FresherMisa.Entities.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.SalaryComposition
{
    public class SalaryCompositionPatchRequest
    {
        public string? SalaryCompositionName { get; set; }

        public string? OrganizationIDs { get; set; }

        public SalaryCompositionType? SalaryCompositionType { get; set; }

        public Nature? Nature { get; set; }

        public TaxType? TaxType { get; set; }

        public bool? IsTaxReduction { get; set; }

        public string? NormFormula { get; set; }

        public bool? AllowOverNorm { get; set; }

        public SalaryValueType? ValueType { get; set; }

        public string? ValueFormula { get; set; }

        public string? Description { get; set; }

        public PayslipDisplayType? PayslipDisplayType { get; set; }

        public Status? Status { get; set; }
    }
}
