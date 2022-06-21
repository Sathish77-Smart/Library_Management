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
    }
}