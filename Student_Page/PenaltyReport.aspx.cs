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
    public partial class PenaltyReport : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Library"].ConnectionString);
        Connect_db connect_Db = new Connect_db();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (Session["student_id"] == null)
            {
                Response.Redirect("../Default.aspx");
            }
            else
            {
                if (Page.IsPostBack == false)
                {
                    var data = connect_Db.Penalty_Report(Convert.ToInt32(Session["student_id"].ToString()), con);
                    if(data.Tables[0].Rows.Count != 0)
                    {
                        GridView3.DataSource = data;
                        GridView3.DataBind();
                        Label1.Text = "";
                    }
                    else
                    {
                        Label1.Text = "Penalty is not available !!";
                    }
                }
            }
            con.Close();
        }
    }
}