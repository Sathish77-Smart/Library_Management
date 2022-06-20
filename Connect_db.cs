using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Drawing;
using System.IO;

namespace Library_Management
{
    public class Connect_db
    {
        protected DataSet Convert_Id_to_Name(DataSet ds,SqlConnection con)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string cmd2 = "select Publication_name from Publication_Master where Id = " + ds.Tables[0].Rows[i]["Publication"] + "";
                SqlCommand SqlCmd2 = new SqlCommand(cmd2, con);
                SqlDataReader dr = SqlCmd2.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    ds.Tables[0].Rows[i]["Publication"] = dr["Publication_name"].ToString();
                }
                dr.Close();
                string cmd3 = "select BranchName from Branch_Master where Id = " + ds.Tables[0].Rows[i]["Branch"] + "";
                SqlCommand SqlCmd3 = new SqlCommand(cmd3, con);
                SqlDataReader dr1 = SqlCmd3.ExecuteReader();
                if (dr1.HasRows)
                {
                    dr1.Read();
                    ds.Tables[0].Rows[i]["Branch"] = dr1["BranchName"].ToString();
                }
                dr1.Close();
            }
            return ds;
        }

        // Login page
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

        // Publication
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

        // Branch
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

        // Book
        public DataSet Book_Select(SqlConnection con)
        {
            string cmd1 = "select * from Book_Master";
            SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
            da.Fill(ds);
            var ds1 = Convert_Id_to_Name(ds,con);
            return ds1;
        }
        public void Book_Insert(string bookname, string bookdetails, string author, string pub_id, string branch_id, double price, int qty, string picture, SqlConnection con)
        {
            string cmd = "Insert into Book_Master values ('" + bookname + "','"+bookdetails+"','"+author+"',"+pub_id+","+branch_id+","+price+","+qty+",'"+picture+"',"+qty+","+0+")";
            SqlCommand SqlCmd2 = new SqlCommand(cmd, con);
            SqlCmd2.ExecuteNonQuery();
        }
        public void Book_Update(int id, string bookname, string bookdetails, string author, int pub_id, int branch_id, double price, int qty, string picture, SqlConnection con)
        {
            string cmd = "Update Book_Master set BookName = '" + bookname + "', BookDetails = '"+bookdetails+"', AuthorName = '"+author+"', Publication_Id = "+pub_id+", Branch_Id = "+branch_id+", Price = "+price+", Quantity = "+qty+", Picture = '"+picture+"' where Id = " + id + "";
            SqlCommand SqlCmd2 = new SqlCommand(cmd, con);
            SqlCmd2.ExecuteNonQuery();
        }
        public void Book_Delete(int id, SqlConnection con)
        {
            string cmd = "Delete from Book_Master where Id = " + id + "";
            SqlCommand SqlCmd2 = new SqlCommand(cmd, con);
            SqlCmd2.ExecuteNonQuery();
        }
        public DataSet Branch_Report_Select(string name, SqlConnection con)
        {
            string cmd1 = "select * from Book_Master where Branch = '"+name+"'";
            SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
            da.Fill(ds);
            var ds1 = Convert_Id_to_Name(ds, con);
            return ds1;
        }
        public DataSet Publication_Report_Select(string name, SqlConnection con)
        {
            string cmd1 = "select * from Book_Master where Publication = '" + name + "'";
            SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
            da.Fill(ds);
            var ds1 = Convert_Id_to_Name(ds, con);
            return ds1;
        }
        public DataSet Book_Report_Select(int id, SqlConnection con)
        {
            string cmd1 = "select * from Book_Master where Id = " + id + "";
            SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
            da.Fill(ds);
            var ds1 = Convert_Id_to_Name(ds, con);
            return ds1;
        }
    }
}