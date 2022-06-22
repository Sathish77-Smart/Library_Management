using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                if(Session["admin_user"] != null)
                {
                    Label1.Text = Session["admin_user"].ToString();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }
    }
}