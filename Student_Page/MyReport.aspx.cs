using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management.Student_Page
{
    public partial class MyReport : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Library"].ConnectionString);
        Connect_db connect_Db = new Connect_db();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student_id"] == null)
            {
                Response.Redirect("../Default.aspx");
            }
            else
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
        }
        protected void drpbranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpbranch.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Branch !!";
                GridView1.DataSource = null;
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
                GridView1.DataSource = null;
                con.Close();
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            con.Open();
            MultiView1.ActiveViewIndex = 1;
            var data = connect_Db.Book_Report_Select(Convert.ToInt32(e.CommandArgument.ToString()), con);
            lblbname.Text = data.Tables[0].Rows[0]["BookName"].ToString();
            lblauthor.Text = data.Tables[0].Rows[0]["AuthorName"].ToString();
            lblbran.Text = data.Tables[0].Rows[0]["Branch"].ToString();
            lblpub.Text = data.Tables[0].Rows[0]["Publication"].ToString();
            lblprice.Text = data.Tables[0].Rows[0]["price"].ToString();
            lblqnt.Text = data.Tables[0].Rows[0]["Quantity"].ToString();
            lblaqnt.Text = data.Tables[0].Rows[0]["Available_Qty"].ToString();
            lblrqnt.Text = data.Tables[0].Rows[0]["Rent"].ToString();
            lbldetail.Text = data.Tables[0].Rows[0]["BookDetails"].ToString();
            Image2.ImageUrl = data.Tables[0].Rows[0]["Picture"].ToString();
            con.Close();
            lblmsg.Text = "";
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            con.Open();
            if(drpstudent.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Student !!";
                MultiView1.ActiveViewIndex = -1;
            }
            else if(drpbranch.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Branch !!";
                MultiView1.ActiveViewIndex = -1;
            }
            else
            {
                var data = connect_Db.Book_Borrowed(Convert.ToInt32(drpstudent.SelectedItem.Value), drpbranch.SelectedValue, con);
                GridView1.DataSource = data;
                GridView1.DataBind();
                if (data.Tables[0].Rows.Count == 0)
                {
                    lblmsg.Text = "No Books Found !!";
                }
                else
                {
                    lblmsg0.Text = GridView1.Rows.Count.ToString() + " - Records Found.";
                    MultiView1.ActiveViewIndex = 0;
                    lblmsg.Text = "";
                }
            }
            con.Close();
        }
        protected void Button11_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }
}