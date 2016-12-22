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

        public Int64 LoginEmployee(EmployeeLogin empLogin)
        {
            try
            {
                GetSqlConnection();
                con.Open();
                using (SqlCommand cmd = new SqlCommand("spLogin", con))
                {
                    cmd.Parameters.AddWithValue("@LoginId", empLogin.loginId);
                    cmd.Parameters.AddWithValue("@Password", empLogin.Password);
                    cmd.CommandType = CommandType.StoredProcedure;
                    var EmployeeID = Convert.ToInt64(cmd.ExecuteScalar());
                    return EmployeeID;
                }
            }
            catch (Exception)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        public bool RegisterEmployee(EmployeeRegister empRegister)
        {
            try
            {
                GetSqlConnection();
                using (SqlCommand cmd = new SqlCommand("spAddEmployee", con))
                {
                    cmd.Parameters.AddWithValue("@FirstName", empRegister.FirstName);
                    cmd.Parameters.AddWithValue("@MiddleName", empRegister.MiddleName);
                    cmd.Parameters.AddWithValue("@LastName", empRegister.LastName);
                    cmd.Parameters.AddWithValue("@Email", empRegister.Email);
                    cmd.Parameters.AddWithValue("@Password", empRegister.Password);
                    cmd.Parameters.AddWithValue("@Mobile", empRegister.Mobile);
                    cmd.Parameters.AddWithValue("@DesignationId", empRegister.DesignationId);
                    cmd.Parameters.AddWithValue("@ProfileImage", empRegister.ProfileImage);
 

                    cmd.CommandType = CommandType.StoredProcedure;
                    var affectedRows = cmd.ExecuteNonQuery();
                    if (affectedRows > 0)
                        return true;
                    else
                        return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
