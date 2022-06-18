using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Library_Management
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Library"].ConnectionString);
        Connect_db login_Db = new Connect_db();
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            if (rdolibrary.Checked == true)
            {
                var data = login_Db.Login_Admin(txtuname.Text, txtupass.Text, con);
                if(data == null)
                {
                    lbl.Text = "Invalid Credentials !!!";
                }
                else
                {
                    Session["admin_id"] = data["Id"].ToString();
                    Session["admin_user"] = data["Username"].ToString();
                    data.Close();
                    lbl.Text = "Login as Admin";
                    Response.Redirect("Home.aspx");
                }
                con.Close();
            }
            else
            {
                var data = login_Db.Login_Student(txtuname.Text, txtupass.Text, con);
                if (data == null)
                {
                    lbl.Text = "Invalid Credentials !!!";
                }
                else
                {
                    Session["student_id"] = data["Id"].ToString();
                    Session["student_user"] = data["Username"].ToString();
                    data.Close();
                    lbl.Text = "Login as Student";
                    //Response.Redirect("");
                }
                con.Close();
            }
        }
    }
}