using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gem.BO
{
    
    public class EmployeeLogin
    {
        // either email or mobile
        public string loginId { get; set; }
        public string Password { get; set; }
    }

    public class EmployeeMeta
    {
        public string Email { get; set; }
        public string Mobile { get; set; }
    }

    public class EmployeeDetails : EmployeeMeta
    {
        public Int64 EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string ProfileImage { get; set; }

    }

    public class EmployeeBO : EmployeeDetails
    {
        public Int16 DesignationId { get; set; }
    }

    public class EmployeeRegister : EmployeeBO
    {
        public string Password { get; set; }
    }    
}
