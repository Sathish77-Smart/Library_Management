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
    public partial class Add_Branch : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Library"].ConnectionString);
        Connect_db connect_Db = new Connect_db();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            var data = connect_Db.Branch_Select(con);
            GridView1.DataSource = data;
            GridView1.DataBind();
            con.Close();
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            con.Open();
            connect_Db.Branch_Insert(txtpub.Text, con);
            var data = connect_Db.Branch_Select(con);
            GridView1.DataSource = data;
            GridView1.DataBind();
            con.Close();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            con.Open();
            GridView1.EditIndex = e.NewEditIndex;
            var data = connect_Db.Branch_Select(con);
            GridView1.DataSource = data;
            GridView1.DataBind();
            con.Close();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            con.Open();
            GridView1.EditIndex = -1;
            var data = connect_Db.Branch_Select(con);
            GridView1.DataSource = data;
            GridView1.DataBind();
            con.Close();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            con.Open();
            int pid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            TextBox pname = GridView1.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox;
            connect_Db.Branch_Update(pid, pname.Text, con);
            lblmsg.Text = "Record Updated !!";
            GridView1.EditIndex = -1;
            var data = connect_Db.Branch_Select(con);
            GridView1.DataSource = data;
            GridView1.DataBind();
            con.Close();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            /*int bid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            PubDT = PubAdapter.Select_By_PID(bid);

            BDT = BAdapter.Select_By_Publication(PubDT.Rows[0]["publication"].ToString());
            if (BDT.Rows.Count > 0)
            {
                lblmsg.Text = "Please, delete all books of this publication.";
            }
            else
            {
                connect_Db.Publication_Delete(bid, con);
                lblmsg.Text = "Record Deleted !!";
                var data = connect_Db.Publication_Select(con);
                GridView1.DataSource = data;
                GridView1.DataBind();
            }*/
            con.Close();
        }
    }
}