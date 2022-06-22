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
    public partial class MyAccount : System.Web.UI.Page
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
                Label1.Text = "";
                MultiView1.ActiveViewIndex = 0;
                var data = connect_Db.Student_Report_Select(Convert.ToInt32(Session["student_id"].ToString()), null, null, con);
                lblnam.Text = data.Tables[0].Rows[0]["StudentName"].ToString();
                lblmobile.Text = data.Tables[0].Rows[0]["Mobile"].ToString();
                lbladd.Text = data.Tables[0].Rows[0]["Address"].ToString();
                lblcity.Text = data.Tables[0].Rows[0]["City"].ToString();
                lblpincode.Text = data.Tables[0].Rows[0]["Pincode"].ToString();
                lblemail.Text = data.Tables[0].Rows[0]["Email"].ToString();
            }
            con.Close();
        }
        protected void Button12_Click(object sender, EventArgs e)
        {
            con.Open();
            var data = connect_Db.Student_Report_Select(Convert.ToInt32(Session["student_id"].ToString()), null, null, con);
            lblnam.Text = data.Tables[0].Rows[0]["StudentName"].ToString();
            lblmobile.Text = data.Tables[0].Rows[0]["Mobile"].ToString();
            lbladd.Text = data.Tables[0].Rows[0]["Address"].ToString();
            lblcity.Text = data.Tables[0].Rows[0]["City"].ToString();
            lblpincode.Text = data.Tables[0].Rows[0]["Pincode"].ToString();
            lblemail.Text = data.Tables[0].Rows[0]["Email"].ToString();
            MultiView1.ActiveViewIndex = 0;
            con.Close();
        }
        protected void Button13_Click(object sender, EventArgs e)
        {
            con.Open();
            MultiView1.ActiveViewIndex = 1;
            var data = connect_Db.Student_Report_Select(Convert.ToInt32(Session["student_id"].ToString()), null, null, con);
            txtname.Text = data.Tables[0].Rows[0]["Studentname"].ToString();
            txtname0.Text = data.Tables[0].Rows[0]["mobile"].ToString();
            txtname1.Text = data.Tables[0].Rows[0]["address"].ToString();
            txtname2.Text = data.Tables[0].Rows[0]["city"].ToString();
            txtname3.Text = data.Tables[0].Rows[0]["pincode"].ToString();
            txtname4.Text = data.Tables[0].Rows[0]["email"].ToString();
            con.Close();
        }
        protected void btnupdate_Click(object sender, EventArgs e)
        {
            con.Open();
            connect_Db.Student_Update(Convert.ToInt32(Session["student_id"].ToString()), txtname.Text, txtname0.Text, txtname1.Text, txtname2.Text, txtname3.Text, txtname4.Text, con);
            con.Close();
            Button12_Click(sender, e);
        }
        protected void Button14_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }
        protected void Button15_Click(object sender, EventArgs e)
        {
            con.Open();
            if (txtpass.Text == "")
            {
                Label1.Text = "Enter Password";
            }
            else if (txtpass.Text != txtcpass.Text)
            {
                Label1.Text = "Password not same !!";
            }
            else
            {
                connect_Db.Student_Password_Update(Convert.ToInt32(Session["student_id"].ToString()), txtpass.Text, con);
                Label1.Text = "Password has been changed !!";
            }
            MultiView1.ActiveViewIndex = 2;
            con.Close();
        }
    }
}