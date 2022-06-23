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
    public partial class StudentReport : System.Web.UI.Page
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
                    lblmsg.Text = "";
                }
            }
        }
        protected void btnseach_Click(object sender, EventArgs e)
        {
            con.Open();
            if (drpbranch.SelectedIndex == 0 && DropDownList1.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Branch and Student name !!";
            }
            else
            {
                var data = connect_Db.Student_Report_Select(0,drpbranch.SelectedItem.Value,DropDownList1.SelectedItem.Text, con);
                GridView1.DataSource = data;
                GridView1.DataBind();
                lbl.Text = GridView1.Rows.Count.ToString() + " - Records Found.";

                MultiView1.ActiveViewIndex = 0;
                lblmsg.Text = "";
            }
            con.Close();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            con.Open();
            MultiView1.ActiveViewIndex = 1;
            var data = connect_Db.Student_Report_Select(Convert.ToInt32(e.CommandArgument.ToString()),null,null, con);
            lblid.Text = data.Tables[0].Rows[0]["Id"].ToString();
            lblname.Text = data.Tables[0].Rows[0]["StudentName"].ToString();
            lblmobile.Text = data.Tables[0].Rows[0]["Mobile"].ToString();
            lbladdress.Text = data.Tables[0].Rows[0]["Address"].ToString();
            lblcity.Text = data.Tables[0].Rows[0]["City"].ToString();
            lblpin.Text = data.Tables[0].Rows[0]["Pincode"].ToString();
            lbldob.Text = data.Tables[0].Rows[0]["DoB"].ToString();
            lblbranch.Text = data.Tables[0].Rows[0]["Branch"].ToString();
            lblemai.Text = data.Tables[0].Rows[0]["Email"].ToString();
            lblpass.Text = data.Tables[0].Rows[0]["Password"].ToString();
            Image2.ImageUrl = data.Tables[0].Rows[0]["Photo"].ToString();
            con.Close();
            lblmsg.Text = "";
        }
        protected void Button11_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void drpbranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(drpbranch.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Branch and Student name !!";
            }
            else
            {
                con.Open();
                var name = connect_Db.Student_Branch_Select(drpbranch.SelectedItem.Value, con);
                DropDownList1.DataSource = name;
                DropDownList1.DataTextField = "StudentName";
                DropDownList1.DataValueField = "Id";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, "SELECT");
                lblmsg.Text = "";
                con.Close();
            }
        }
    }
}