using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_id"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            lblname.Text = Session["admin_user"].ToString();
        }
        protected void Button10_Click(object sender, EventArgs e)
        {
            Session["admin_id"] = null;
            Session["admin_user"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}