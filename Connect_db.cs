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
                if (ds.Tables[0].Columns.Contains("Publication")) {
                    string cmd2 = "select Publication_name from Publication_Master where Id = " + ds.Tables[0].Rows[i]["Publication"] + "";
                    SqlCommand SqlCmd2 = new SqlCommand(cmd2, con);
                    SqlDataReader dr = SqlCmd2.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        ds.Tables[0].Rows[i]["Publication"] = dr["Publication_name"].ToString();
                    }
                    dr.Close();
                }
                if (ds.Tables[0].Columns.Contains("Branch"))
                {
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

        // Student
        public DataSet Student_Select(SqlConnection con)
        {
            string cmd1 = "select * from Student_Table";
            SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
            da.Fill(ds);
            var ds1 = Convert_Id_to_Name(ds, con);
            return ds1;
        }
        public void Student_Insert(string name, string branch, string gender, string dob, string mobile, string address, string city, string pincode, string photo, string email, string password, SqlConnection con)
        {
            string cmd1 = "Update Number_master Set Student_Id = Student_Id + 1 ";
            SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
            SqlCmd1.ExecuteNonQuery();
            string cmd2 = "Select Student_Id from Number_master ";
            SqlCommand SqlCmd2 = new SqlCommand(cmd2, con);
            SqlDataReader dr = SqlCmd2.ExecuteReader();
            dr.Read();
            int Id = dr.GetInt32(0);
            dr.Close();
            string cmd = "Insert into Student_Table values (" + Id + ",'" + name + "','" + branch + "','" + gender + "','" + dob + "','" + mobile + "','" + address + "','" + city + "','" + pincode + "','" + photo + "','" + email + "','" + password + "')";
            SqlCommand SqlCmd3 = new SqlCommand(cmd, con);
            SqlCmd3.ExecuteNonQuery();
            string cmd3 = "Insert into Student_Login values (" + Id + ",'" + name + "','" + password + "','student')";
            SqlCommand SqlCmd4 = new SqlCommand(cmd3, con);
            SqlCmd4.ExecuteNonQuery();
        }
        public DataSet Student_Report_Select(int id, string branch, string name, SqlConnection con)
        {
            if(id != 0)
            {
                string cmd1 = "select * from Student_Table where Id = "+id+"";
                SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
                da.Fill(ds);
                var ds1 = Convert_Id_to_Name(ds, con);
                return ds1;
            }
            else
            {
                string cmd1 = "select * from Student_Table where Branch = '" + branch + "' and StudentName = '" + name + "'";
                SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
                da.Fill(ds);
                var ds1 = Convert_Id_to_Name(ds, con);
                return ds1;
            }
        }
        public DataSet Student_Branch_Select(string branch, SqlConnection con)
        {
            string cmd1 = "select * from Student_Table where Branch = '"+branch+"'";
            SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
            da.Fill(ds);
            var ds1 = Convert_Id_to_Name(ds, con);
            return ds1;
        }
        public void Student_Update(int id, string name, string mobile, string address, string city, string pincode, string email, SqlConnection con)
        {
            string cmd2 = "Update Student_Table set StudentName = '"+name+"', Mobile = '"+mobile+"', Address = '"+address+"', City = '"+city+"', Pincode = '"+pincode+"', Email = '"+email+"' where Id = " + id + "";
            SqlCommand SqlCmd2 = new SqlCommand(cmd2, con);
            SqlCmd2.ExecuteNonQuery();
            string cmd3 = "Update Student_Login set Username = '" + name + "' where Id = " + id + "";
            SqlCommand SqlCmd3 = new SqlCommand(cmd3, con);
            SqlCmd3.ExecuteNonQuery();
        }
        public void Student_Password_Update(int id, string pass, SqlConnection con)
        {
            string cmd3 = "Update Student_Login set Password = '" + pass + "' where Id = " + id + "";
            SqlCommand SqlCmd3 = new SqlCommand(cmd3, con);
            SqlCmd3.ExecuteNonQuery();
        }

        // Issue Book
        public DataSet Select_IBook_Row(string bookname, int stu_id, string Branch, SqlConnection con)
        {
            if(bookname == null && Branch == null)
            {
                string cmd1 = "select * from Issue_Books where StudentId = " + stu_id + " and Book_Return = 1";
                SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
                da.Fill(ds);
                var ds1 = Convert_Id_to_Name(ds, con);
                return ds1;
            }
            else if(bookname != null && stu_id > 0)
            {
                string cmd1 = "select * from Issue_Books where BookName = '" + bookname + "' and StudentId = " + stu_id + " and Book_Return = 1";
                SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
                da.Fill(ds);
                var ds1 = Convert_Id_to_Name(ds, con);
                return ds1;
            }
            else if(Branch!= null && stu_id > 0 && bookname == null)
            {
                string cmd1 = "select * from Issue_Books where Branch = '" + Branch + "' and Book_Return = 1 and StudentId = " + stu_id + "";
                SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
                da.Fill(ds);
                var ds1 = Convert_Id_to_Name(ds, con);
                return ds1;
            }
            else
            {
                string cmd1 = "select * from Issue_Books where Branch = '" + Branch + "' and StudentId = " + stu_id + " and Book_Return = 1 and BookName = '"+bookname+"'";
                SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(SqlCmd1);
                da.Fill(ds);
                var ds1 = Convert_Id_to_Name(ds, con);
                return ds1;
            }
        }
        public void Issue_Book_Insert(int bookid, string bookname, int stuid, string stuname, string branch, string publi, int returndays, string issuedate, SqlConnection con)
        {
            DateTime returndate = Convert.ToDateTime(issuedate);
            returndate.AddDays(returndays);
            string cmd = "Insert into Issue_Books(BookId,BookName,StudentId,StudentName,Branch,Publication,Return_Days,Issue_Date,Book_Return,Due_Date) values (" + bookid + ",'" + bookname + "'," + stuid + ",'" + stuname + "','" + branch + "','" + publi + "'," + returndays + ",'" + issuedate + "',"+1+",'"+returndate.ToString("dd/MM/yyyy")+"')";
            SqlCommand SqlCmd3 = new SqlCommand(cmd, con);
            SqlCmd3.ExecuteNonQuery();
            string cmd1 = "Update Book_Master set Available_Qty = Available_Qty - 1, Rent = Rent + 1 where BookName = '"+bookname+"'";
            SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
            SqlCmd1.ExecuteNonQuery();
        }

        // Return Book
        public void Book_Return(int BookId, int IssueId, int StudentId, SqlConnection con)
        {
            string cmd1 = "Update Book_Master set Available_Qty = Available_Qty + 1, Rent = Rent - 1 where Id = '" + BookId + "'";
            SqlCommand SqlCmd1 = new SqlCommand(cmd1, con);
            SqlCmd1.ExecuteNonQuery();
            DateTime dateTime = DateTime.Now;
            string cmd2 = "Update Issue_Books set Book_Return = 0, Return_Days = 0, Return_Date = '"+dateTime.ToString("dd/MM/yyyy")+"' where BookId = " + BookId + " and Id = "+IssueId+" and StudentId = "+StudentId+"";
            SqlCommand SqlCmd2 = new SqlCommand(cmd2, con);
            SqlCmd2.ExecuteNonQuery();
        }

        // Penalty 
        public void Penalty(int issueid, int StudentId, string StudentName, int BookId, string BranchId, double penaltyamt, string Reason, SqlConnection con)
        {
            string cmd = "Insert into Penalty_Table values (" + issueid + "," + StudentId + ",'" + StudentName + "'," + BookId + ",'" + BranchId + "'," + penaltyamt + ",'" + Reason + "')";
            SqlCommand SqlCmd3 = new SqlCommand(cmd, con);
            SqlCmd3.ExecuteNonQuery();
            DateTime dateTime = DateTime.Now;
            dateTime.AddDays(2);
            string cmd2 = "Update Issue_Books set Due_Date = '"+ dateTime.ToString("dd/MM/yyyy") + "' where BookId = " + BookId + " and Id = " + issueid + " and StudentId = " + StudentId + "";
            SqlCommand SqlCmd2 = new SqlCommand(cmd2, con);
            SqlCmd2.ExecuteNonQuery();
        }

    }
}