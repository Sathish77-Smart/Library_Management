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
    public partial class BookReport : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Library"].ConnectionString);
        Connect_db connect_Db = new Connect_db();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student_id"] == null)
            {
                Response.Redirect("../Default.aspx");
            }
        }
        protected void btntaken_Click(object sender, EventArgs e)
        {
            con.Open();
            var data = connect_Db.Select_IBook_Row(null, Convert.ToInt32(Session["student_id"].ToString()), null, con);
            GridView1.DataSource = data;
            GridView1.DataBind();
            MultiView1.ActiveViewIndex = 0;
            lblb.Text = GridView1.Rows.Count.ToString();
            con.Close();
        }
        protected void btnreturn_Click(object sender, EventArgs e)
        {
            con.Open();
            var data = connect_Db.Select_Book_Return(Convert.ToInt32(Session["student_id"].ToString()), con);
            GridView2.DataSource = data;
            GridView2.DataBind();
            MultiView1.ActiveViewIndex = 1;
            lblr.Text = GridView2.Rows.Count.ToString();
            con.Close();
        }
    }
}