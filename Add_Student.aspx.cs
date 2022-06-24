using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class Add_Student : System.Web.UI.Page
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
                    var data = connect_Db.Student_Select(con);
                    GridView1.DataSource = data;
                    GridView1.DataBind();
                    var branch = connect_Db.Branch_Select(con);
                    drpbranch.DataSource = branch;
                    drpbranch.DataTextField = "BranchName";
                    drpbranch.DataValueField = "Id";
                    drpbranch.DataBind();
                    drpbranch.Items.Insert(0, "SELECT");
                    con.Close();
                }
            }
        }
        protected void btn_add_Click(object sender, EventArgs e)
        {
            con.Open();
            if (FileUpload1.HasFile)
            {
                string extension = Path.GetExtension(FileUpload1.FileName);
                if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg")
                {
                    Stream strm = FileUpload1.PostedFile.InputStream;
                    using (var image = System.Drawing.Image.FromStream(strm))
                    {
                        int newWidth = 183; // New Width of Image in Pixel  
                        int newHeight = 211; // New Height of Image in Pixel  
                        var thumbImg = new Bitmap(newWidth, newHeight);
                        var thumbGraph = Graphics.FromImage(thumbImg);
                        thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                        thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                        thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                        thumbGraph.DrawImage(image, imgRectangle);
                        string targetPath = Server.MapPath(@"~\Student\") + FileUpload1.FileName;
                        thumbImg.Save(targetPath, image.RawFormat);
                        connect_Db.Student_Insert(txtsname.Text, drpbranch.SelectedValue, DropDownList1.SelectedValue, Convert.ToDateTime(TextBox1.Text).ToString("dd/MM/yyyy"), txtmobile.Text, txtaddress.Text, txtcity.Text, txtpincode.Text, "~/Student/" + FileUpload1.FileName.ToString(), txtemail.Text, txtpass.Text, con);
                        var data = connect_Db.Student_Select(con);
                        GridView1.DataSource = data;
                        GridView1.DataBind();
                        con.Close();
                        lblmsg.Text = "Student Added Successfullly !!";
                    }
                }
                else
                {
                    lblmsg.Text = "Image format should be in .png (or) .jpg";
                }
            }
            else
            {
                connect_Db.Student_Insert(txtsname.Text, drpbranch.SelectedValue, DropDownList1.SelectedValue, txtmobile.Text, Convert.ToDateTime(TextBox1.Text).ToString("dd/MM/yyyy"), txtaddress.Text, txtcity.Text, txtpincode.Text,null, txtemail.Text, txtpass.Text, con);
                var data = connect_Db.Student_Select(con);
                GridView1.DataSource = data;
                GridView1.DataBind();
                con.Close();
                lblmsg.Text = "Student Added Successfullly !!";
            }
            txtsname.Text = ""; drpbranch.SelectedIndex = 0;
            DropDownList1.SelectedIndex = 0;
            txtmobile.Text = "";
            txtaddress.Text = ""; txtcity.Text = "";
            txtpincode.Text = "";
            txtemail.Text = "";
            txtpass.Text = "";
            TextBox1.Text = "";

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            con.Open();
            Panel1.Visible = false;
            Panel2.Visible = true;
            int id = Convert.ToInt32(GridView1.Rows[e.NewEditIndex].Cells[1].Text);
            var data = connect_Db.Student_Report_Select(id, null, null, con);
            lblid.Text = data.Tables[0].Rows[0]["Id"].ToString();
            txtname.Text = data.Tables[0].Rows[0]["Studentname"].ToString();
            txtname0.Text = data.Tables[0].Rows[0]["mobile"].ToString();
            txtname1.Text = data.Tables[0].Rows[0]["address"].ToString();
            txtname2.Text = data.Tables[0].Rows[0]["city"].ToString();
            txtname3.Text = data.Tables[0].Rows[0]["pincode"].ToString();
            txtname4.Text = data.Tables[0].Rows[0]["email"].ToString();
            con.Close();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            string id = GridView1.Rows[e.RowIndex].Cells[1].Text;
            var data = connect_Db.Select_IBook_Row(null, Convert.ToInt32(id), null, con);
            if (data.Tables[0].Rows.Count > 0)
            {
                lblmsg.Text = "Unable to Delete, First clear the rented books";
            }
            else
            {
                connect_Db.Student_Delete(Convert.ToInt32(id), con);
                GridView1.DataSource = -1;
                var data1 = connect_Db.Student_Select(con);
                GridView1.DataSource = data1;
                GridView1.DataBind();
                lblmsg.Text = "Deleted Successfully !!";
            }
            con.Close();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            con.Open();
            connect_Db.Student_Update(Convert.ToInt32(lblid.Text),txtname.Text,txtname0.Text,txtname1.Text,txtname2.Text,txtname3.Text,txtname4.Text,con);
            lblmsg.Text = "Student Updated Successfullly !!";
            Panel1.Visible = true;
            Panel2.Visible = false;
            GridView1.EditIndex = -1;
            var data = connect_Db.Student_Select(con);
            GridView1.DataSource = data;
            GridView1.DataBind();
            con.Close();
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            con.Open();
            Panel1.Visible = true;
            Panel2.Visible = false;
            GridView1.EditIndex = -1;
            var data = connect_Db.Student_Select(con);
            GridView1.DataSource = data;
            GridView1.DataBind();
            lblmsg.Text = "";
            lblid.Text = "";
            txtname.Text = "";
            txtname0.Text = "";
            txtname1.Text = "";
            txtname2.Text = "";
            txtname3.Text = "";
            txtname4.Text = "";
            con.Close();
        }
    }
}