using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

namespace Library_Management
{
    public class Connect_db
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
        public DataSet Publication_Select(SqlConnection con)
        {
            string cmd1 = "select * from Publication_Master";
            SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
            da.Fill(ds);
            return ds;
        }
        public void Publication_Insert(string text, SqlConnection con)
        {
            DateTime now = DateTime.Now;
            string cmd = "Insert into Publication_Master(Publication_name,Date) values ('"+text+"','"+now.ToLongDateString()+"')";
            SqlCommand SqlCmd2 = new SqlCommand(cmd, con);
            SqlCmd2.ExecuteNonQuery();
        }
        public void Publication_Update(int id,string name, SqlConnection con)
        {
            string cmd = "Update Publication_Master set Publication_name = '"+name+"' where Id = "+id+"";
            SqlCommand SqlCmd2 = new SqlCommand(cmd, con);
            SqlCmd2.ExecuteNonQuery();
        }
        public void Publication_Delete(int id, SqlConnection con)
        {
            string cmd = "Delete from Publication_Master where Id = " + id + "";
            SqlCommand SqlCmd2 = new SqlCommand(cmd, con);
            SqlCmd2.ExecuteNonQuery();
        }
        public DataSet Branch_Select(SqlConnection con)
        {
            string cmd1 = "select * from Branch_Master";
            SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
            da.Fill(ds);
            return ds;
        }
        public void Branch_Insert(string text, SqlConnection con)
        {
            string cmd = "Insert into Branch_Master(BranchName) values ('" + text + "')";
            SqlCommand SqlCmd2 = new SqlCommand(cmd, con);
            SqlCmd2.ExecuteNonQuery();
        }
        public void Branch_Update(int id, string name, SqlConnection con)
        {
            string cmd = "Update Branch_Master set BranchName = '" + name + "' where Id = " + id + "";
            SqlCommand SqlCmd2 = new SqlCommand(cmd, con);
            SqlCmd2.ExecuteNonQuery();
        }
        public void Branch_Delete(int id, SqlConnection con)
        {
            string cmd = "Delete from Branch_Master where Id = " + id + "";
            SqlCommand SqlCmd2 = new SqlCommand(cmd, con);
            SqlCmd2.ExecuteNonQuery();
        }
    }
}