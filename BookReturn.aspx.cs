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
    public partial class BookReturn : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Library"].ConnectionString);
        Connect_db connect_Db = new Connect_db();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                if (Session["admin_id"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                else
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
            if(drpstudent.SelectedIndex == 0)
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
                var book = connect_Db.Book_Report_Select(Convert.ToInt32(drpbook.SelectedValue), con);
                ViewState["BBID"] = book.Tables[0].Rows[0]["Id"].ToString();
                lblbname.Text = book.Tables[0].Rows[0]["BookName"].ToString();
                lblauthor.Text = book.Tables[0].Rows[0]["AuthorName"].ToString();
                lblbran.Text = book.Tables[0].Rows[0]["Branch"].ToString();
                lblpub.Text = book.Tables[0].Rows[0]["Publication"].ToString();
                lblprice.Text = book.Tables[0].Rows[0]["Price"].ToString();

                Image2.ImageUrl = book.Tables[0].Rows[0]["Picture"].ToString();

                var data = connect_Db.Select_IBook_Row(drpbook.SelectedItem.Text, Convert.ToInt32(drpstudent.SelectedValue), drpbranch.SelectedValue, con);
                lblstudent.Text = data.Tables[0].Rows[0]["StudentName"].ToString();
                lbldays.Text = data.Tables[0].Rows[0]["Return_Days"].ToString();
                lblidate.Text = data.Tables[0].Rows[0]["Issue_Date"].ToString();
                ViewState["RRID"] = data.Tables[0].Rows[0]["Id"].ToString();

                int iday = Convert.ToDateTime(data.Tables[0].Rows[0]["Due_Date"].ToString()).Day;
                int rday = System.DateTime.Now.Day;
                if (rday>iday)
                {
                    lblpanalty.Text = "Yes";
                }
                else
                {
                    lblpanalty.Text = "NO";
                }
            }
            con.Close();
            lblbook.Text = "";
        }
        protected void btnreturnbook_Click(object sender, EventArgs e)
        {
            con.Open();
            if (lblpanalty.Text == "Yes")
            {
                lblbook.Text = "Please, Pay Penalty before return book !!";
                lblbook.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                connect_Db.Book_Return(Convert.ToInt32(drpbook.SelectedItem.Value),Convert.ToInt32(ViewState["RRID"].ToString()), Convert.ToInt32(drpstudent.SelectedItem.Value),con);
                lblbook.Text = "Book Returned Successfully !!";
                lblbook.ForeColor = System.Drawing.Color.Green;
            }
            con.Close();
        }
    }
}