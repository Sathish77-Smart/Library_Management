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
    public partial class BookReport : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Library"].ConnectionString);
        Connect_db connect_Db = new Connect_db();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                con.Open();
                var pub = connect_Db.Publication_Select(con);
                DropDownList2.DataSource = pub;
                DropDownList2.DataTextField = "Publication_name";
                DropDownList2.DataValueField = "Id";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, "SELECT");
                var branch = connect_Db.Branch_Select(con);
                DropDownList1.DataSource = branch;
                DropDownList1.DataTextField = "BranchName";
                DropDownList1.DataValueField = "Id";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, "SELECT");
                con.Close();
                lblmsg.Text = "";
            }
        }
        protected void btnviewbranch_Click(object sender, EventArgs e)
        {
            con.Open();
            if (DropDownList1.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Branch !!";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                GridView1.DataSource = null;
                GridView1.DataBind(); MultiView1.ActiveViewIndex = -1;
            }
            else
            {
                var data = connect_Db.Branch_Report_Select(DropDownList1.SelectedItem.Value,con);
                GridView1.DataSource = data;
                GridView1.DataBind();
                lblmsg0.Text = GridView1.Rows.Count.ToString() + " - Records Found.";

                MultiView1.ActiveViewIndex = 0;
            }
            con.Close();
        }
        protected void btnviewpublication_Click(object sender, EventArgs e)
        {
            con.Open();
            if (DropDownList2.SelectedIndex == 0)
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                lblmsg.Text = "Select Publication !!";
                lblmsg.ForeColor = System.Drawing.Color.Red; MultiView1.ActiveViewIndex = -1;
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
                var data = connect_Db.Publication_Report_Select(DropDownList2.SelectedItem.Value,con);
                GridView1.DataSource = data;
                GridView1.DataBind();
                lblmsg0.Text = GridView1.Rows.Count.ToString() + " - Records Found.";
            }
            con.Close();
        }
        protected void Button11_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            con.Open();
            MultiView1.ActiveViewIndex = 1;
            var data = connect_Db.Book_Report_Select(Convert.ToInt32(e.CommandArgument.ToString()),con);
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
    }
}