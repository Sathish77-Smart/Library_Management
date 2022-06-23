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
    public partial class IssueReport : System.Web.UI.Page
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
                lbl.Text = "Select Branch !!";
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
                lbl.Text = "";
                GridView1.DataSource = null;
                con.Close();
            }
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            con.Open();
            var data = connect_Db.Select_IBook_Row(null,Convert.ToInt32(drpstudent.SelectedValue),drpbranch.SelectedValue, con);
            GridView1.DataSource = data;
            GridView1.DataBind();
            if (data.Tables[0].Rows.Count == 0)
            {
                lbl.Text = "No Books Found !!";
            }
            else
            {
                lbl.Text = "";
            }
            con.Close();
        }
    }
}