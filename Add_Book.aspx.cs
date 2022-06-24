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
    public partial class Add_Book : System.Web.UI.Page
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
                    var data = connect_Db.Book_Select(con);
                    GridView1.DataSource = data;
                    GridView1.DataBind();
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
                        int newWidth = 207; // New Width of Image in Pixel  
                        int newHeight = 228; // New Height of Image in Pixel  
                        var thumbImg = new Bitmap(newWidth, newHeight);
                        var thumbGraph = Graphics.FromImage(thumbImg);
                        thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                        thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                        thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                        thumbGraph.DrawImage(image, imgRectangle);
                        string targetPath = Server.MapPath(@"~\Book\") + FileUpload1.FileName;
                        thumbImg.Save(targetPath, image.RawFormat);
                        connect_Db.Book_Insert(txtpub.Text, TextBox3.Text, TextBox4.Text, DropDownList2.SelectedValue, DropDownList1.SelectedValue, Convert.ToDouble(TextBox7.Text), Convert.ToInt32(TextBox6.Text), "~/Book/"+FileUpload1.FileName.ToString(), con);
                        var data = connect_Db.Book_Select(con);
                        GridView1.DataSource = data;
                        GridView1.DataBind();
                        con.Close();
                        lblmsg.Text = "Book Added Successfullly !!";
                    }
                }
                else
                {
                    lblmsg.Text = "Image format should be in .png (or) .jpg";
                }
            }
            else
            {
                connect_Db.Book_Insert(txtpub.Text, TextBox3.Text, TextBox4.Text, DropDownList2.SelectedValue, DropDownList1.SelectedValue, Convert.ToDouble(TextBox7.Text), Convert.ToInt32(TextBox6.Text),null, con);
                var data = connect_Db.Book_Select(con);
                GridView1.DataSource = data;
                GridView1.DataBind();
                con.Close();
                lblmsg.Text = "Book Added Successfullly !!";
            }
            txtpub.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox7.Text = "";
            TextBox6.Text = "";
            DropDownList2.SelectedIndex = 0;
            DropDownList1.SelectedIndex = 0;

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            con.Open();
            int id = Convert.ToInt32(GridView1.Rows[e.NewEditIndex].Cells[1].Text);
            var data = connect_Db.Book_Report_Select(id, con);
            TextBox1.Text = data.Tables[0].Rows[0]["BookName"].ToString();
            TextBox2.Text = data.Tables[0].Rows[0]["BookDetails"].ToString();
            TextBox5.Text = data.Tables[0].Rows[0]["AuthorName"].ToString();
            TextBox8.Text = data.Tables[0].Rows[0]["Price"].ToString();
            TextBox9.Text = data.Tables[0].Rows[0]["Quantity"].ToString();
            bookid.Text = data.Tables[0].Rows[0]["Id"].ToString();
            add_panel.Visible = false;
            edit_panel.Visible = true;
            con.Close();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            string id = GridView1.Rows[e.RowIndex].Cells[1].Text;
            var data = connect_Db.Select_IBook_Row(id, 0, null, con);
            if(data.Tables[0].Rows.Count > 0)
            {
                lblmsg.Text = "Unable to Delete, First clear the rented books";
            }
            else
            {
                connect_Db.Book_Delete(Convert.ToInt32(id), con);
                GridView1.DataSource = -1;
                var data1 = connect_Db.Book_Select(con);
                GridView1.DataSource = data1;
                GridView1.DataBind();
                lblmsg.Text = "Deleted Successfully !!";
            }
            con.Close();
        }

        protected void GridView1_RowUpdating(object sender, EventArgs e)
        {
            con.Open();
            connect_Db.Book_Update(Convert.ToInt32(bookid.Text), TextBox1.Text, TextBox2.Text, TextBox5.Text, Convert.ToDouble(TextBox8.Text), Convert.ToInt32(TextBox9.Text), con);
            GridView1.EditIndex = -1;
            var data = connect_Db.Book_Select(con);
            GridView1.DataSource = data;
            GridView1.DataBind();
            add_panel.Visible = true;
            edit_panel.Visible = false;
            lblmsg.Text = "Updated Successfully";
            lblmsg.ForeColor = Color.Green;
            con.Close();
        }

        protected void GridView1_RowCancelingEdit(object sender, EventArgs e)
        {
            con.Open();
            GridView1.EditIndex = -1;
            add_panel.Visible = true;
            edit_panel.Visible = false;
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox5.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            lblmsg.Text = "";
            lblmsg.ForeColor = Color.Red;
            var data = connect_Db.Book_Select(con);
            GridView1.DataSource = data;
            GridView1.DataBind();
            con.Close();
        }
    }
}