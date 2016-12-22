using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Gem.BO;
namespace Gem.Dll
{
    public class EmployeeDll
    {
        private SqlConnection con;

        private void GetSqlConnection()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["GECConnection"].ToString();
            con = new SqlConnection(connectionString);
        }

        public string LoginEmployee(EmployeeLogin empLogin)
        {
            try
            {
                GetSqlConnection();
                using (SqlCommand cmd = new SqlCommand("spLogin", con))
                {
                    cmd.Parameters.AddWithValue("@LoginId", empLogin.loginId);
                    cmd.Parameters.AddWithValue("@Password", empLogin.Password);
                    cmd.CommandType = CommandType.StoredProcedure;
                    var EmployeeID = Convert.ToInt64(cmd.ExecuteScalar());
                    Console.WriteLine(EmployeeID);
                }
            }
            catch (Exception)
            {

            }
            return null;
        }

        public Int16 RegisterEmployee(Emp)
    }
}
