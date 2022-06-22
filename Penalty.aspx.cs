using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class Penalty : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Library"].ConnectionString);
        Connect_db connect_Db = new Connect_db();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                con.Open();
                var branch = connect_Db.Branch_Select(con);
                drpbranch.DataSource = branch;
                drpbranch.DataTextField = "BranchName";
                drpbranch.DataValueField = "Id";
                drpbranch.DataBind();
                drpbranch.Items.Insert(0, "SELECT");
                con.Close();
            }
        }
        protected void drpbranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpbranch.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Branch and Student name !!";
                MultiView1.ActiveViewIndex = -1;
            }
            else
            {
                con.Open();
                var name = connect_Db.Student_Branch_Select(drpbranch.SelectedItem.Value, con);
                drpstudent.DataSource = name;
                drpstudent.DataTextField = "StudentName";
                drpstudent.DataValueField = "Id";
                drpstudent.DataBind();
                drpstudent.Items.Insert(0, "SELECT");
                lblmsg.Text = "";
                con.Close();
            }
        }
        protected void drpstudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpstudent.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Branch and Student name !!";
                MultiView1.ActiveViewIndex = -1;
            }
            else
            {
                con.Open();
                var book = connect_Db.Select_IBook_Row(null, Convert.ToInt32(drpstudent.SelectedValue), drpbranch.SelectedValue, con);
                drpbook.DataSource = book;
                drpbook.DataTextField = "BookName";
                drpbook.DataValueField = "BookId";
                drpbook.DataBind();
                drpbook.Items.Insert(0, "SELECT");
                con.Close();
            }
        }
        protected void Button12_Click(object sender, EventArgs e)
        {
            lblmsg.Text = "";
            con.Open();
            if (drpbranch.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Branch !!";
                lblmsg.ForeColor = System.Drawing.Color.Red; MultiView1.ActiveViewIndex = -1;
            }
            else if (drpstudent.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Student !!";
                lblmsg.ForeColor = System.Drawing.Color.Red; MultiView1.ActiveViewIndex = -1;
            }
            else if (drpbook.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Book !!";
                lblmsg.ForeColor = System.Drawing.Color.Red; MultiView1.ActiveViewIndex = -1;
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
                lblpanalty.Text = "Yes";
                var book = connect_Db.Book_Report_Select(Convert.ToInt32(drpbook.SelectedValue), con);
                ViewState["BBID"] = book.Tables[0].Rows[0]["Id"].ToString();
                lblbname.Text = book.Tables[0].Rows[0]["BookName"].ToString();
                lblauthor.Text = book.Tables[0].Rows[0]["AuthorName"].ToString();
                lblbran.Text = book.Tables[0].Rows[0]["Branch"].ToString();
                lblpub.Text = book.Tables[0].Rows[0]["Publication"].ToString();
                lblprice.Text = book.Tables[0].Rows[0]["Price"].ToString();
                Image2.ImageUrl = book.Tables[0].Rows[0]["Picture"].ToString();

                var data = connect_Db.Select_IBook_Row(drpbook.SelectedItem.Text, Convert.ToInt32(drpstudent.SelectedValue), drpbranch.SelectedValue, con);
                lbldays.Text = data.Tables[0].Rows[0]["Return_Days"].ToString();
                lblstudent.Text = data.Tables[0].Rows[0]["StudentName"].ToString();
                lblidate.Text = data.Tables[0].Rows[0]["Issue_Date"].ToString();
                ViewState["RRID"] = data.Tables[0].Rows[0]["Id"].ToString();
                ViewState["SID"] = data.Tables[0].Rows[0]["StudentId"].ToString();
                lblmsg.Text = "";

                int iday = Convert.ToDateTime(data.Tables[0].Rows[0]["Due_Date"].ToString()).Day;
                int rday = System.DateTime.Now.Day;
                if (rday > iday && data.Tables[0].Rows[0]["Return_Date"] != null)
                {
                    lblpanalty.Text = "Yes";
                }
                else

                {
                    lblpanalty.Text = "NO";
                    MultiView1.ActiveViewIndex = -1;
                    lblmsg.Text = "Book : "+drpbook.SelectedItem.Text+" due date is not over !!!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
            con.Close();
            lblpay.Text = "";
        }
        protected void btnpaypenalty_Click(object sender, EventArgs e)
        {
            con.Open();
            if (txtpenalty.Text == "")
            {
                lblpay.Text = "Enter amount !!";
            }
            else if (txtdetail.Text == "")
            {
                lblpay.Text = "Enter Reason detail !!";
            }
            else
            {
                lblmsg.Text = "Amount paid successfully !!";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                connect_Db.Penalty(Convert.ToInt32(ViewState["RRID"].ToString()), Convert.ToInt32(ViewState["SID"].ToString()),drpstudent.SelectedItem.Text, Convert.ToInt32(ViewState["BBID"].ToString()), drpbranch.SelectedItem.Value, Convert.ToDouble(txtpenalty.Text), txtdetail.Text, con);
                txtdetail.Text = "";
                txtpenalty.Text = "";
                MultiView1.ActiveViewIndex = -1;
                var name = connect_Db.Student_Branch_Select(drpbranch.SelectedItem.Value, con);
                drpstudent.DataSource = name;
                drpstudent.DataTextField = "StudentName";
                drpstudent.DataValueField = "Id";
                drpstudent.DataBind();
                drpstudent.Items.Insert(0, "SELECT");
                drpbook.Items.Clear();
                drpbook.Items.Insert(0, "SELECT");
            }
        }
    }
}