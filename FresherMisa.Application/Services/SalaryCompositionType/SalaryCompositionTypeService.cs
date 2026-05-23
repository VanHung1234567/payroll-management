using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.GridConfig;
using FresherMisa.Entities.SalaryCompositionType;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Services
{
    public class SalaryCompositionTypeService : BaseService<SalaryCompositionType>, ISalaryCompositionTypeService
    {
        private readonly ISalaryCompositionTypeRepository _salaryCompositionTypeRepository;

        public SalaryCompositionTypeService(
            IBaseRepository<SalaryCompositionType> baseRepository,
            ISalaryCompositionTypeRepository salaryCompositionTypeRepository
            ) : base(baseRepository)
        {
            _salaryCompositionTypeRepository = salaryCompositionTypeRepository;
        }


        #region OVERRIDE METHODS
        protected override List<ValidationError> ValidateCustom(SalaryCompositionType entity)
        {
            return new List<ValidationError>();
        }
        #endregion OVERRIDE METHODS
    }
}
