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
            }

        }
    }
}