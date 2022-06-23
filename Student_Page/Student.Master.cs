using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management.Student_Page
{
    public partial class Student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student_id"] == null)
            {
                Response.Redirect("../Default.aspx");
            }
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Session["student_id"] = null;
            Response.Redirect("../Default.aspx");
        }
    }
}