using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Entities.Enums
{
    public enum SalaryCompositionType
    {
        /// <summary>
        /// Thông tin nhân viên
        /// </summary>
        EmployeeInfo = 1,

        /// <summary>
        /// Chấm công
        /// </summary>
        Attendance = 2,

        /// <summary>
        /// Doanh số
        /// </summary>
        Sales = 3,

        /// <summary>
        /// KPI
        /// </summary>
        KPI = 4,

        /// <summary>
        /// Sản Phẩm
        /// </summary>
        Product = 5,

        /// <summary>
        /// Lương
        /// </summary>
        Salary = 6,

        /// <summary>
        /// Thuế thu nhập cá nhân
        /// </summary>
        PIT = 7,

        /// <summary>
        /// Bảo hiểm và công đoàn
        /// </summary>
        InsuranceUnion = 8,

        /// <summary>
        /// Khác
        /// </summary>
        Other = 9
    }
}
