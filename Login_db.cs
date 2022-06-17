using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

namespace Library_Management
{
    public class Login_db
    {

        public SqlDataReader Login_Admin(string username, string password, SqlConnection con)
        {
            string cmd2 = "select * from Admin_Login where Username='" + username + "' and Password='" + password + "'";
            SqlCommand SqlCmd2 = new SqlCommand(cmd2, con);
            SqlDataReader dr = SqlCmd2.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                return dr;
            }
            else
            {
                return null;
            }
        }
        public SqlDataReader Login_Student(string username, string password, SqlConnection con)
        {
            string cmd2 = "select * from Student_Login where Username='" + username + "' and Password='" + password + "'";
            SqlCommand SqlCmd2 = new SqlCommand(cmd2, con);
            SqlDataReader dr = SqlCmd2.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                return dr;
            }
            else
            {
                return null;
            }
        }
    }
}