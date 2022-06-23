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
    public partial class IssueBook : System.Web.UI.Page
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
                    var pub = connect_Db.Publication_Select(con);
                    drppublication.DataSource = pub;
                    drppublication.DataTextField = "Publication_name";
                    drppublication.DataValueField = "Id";
                    drppublication.DataBind();
                    drppublication.Items.Insert(0, "SELECT");
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

        protected void drppublication_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            var book = connect_Db.Publication_Report_Select(drppublication.SelectedItem.Value,con);
            drpbook.DataSource = book;
            drpbook.DataTextField = "BookName";
            drpbook.DataValueField = "Id";
            drpbook.DataBind();
            drpbook.Items.Insert(0, "SELECT");
            con.Close();
        }
        protected void Button12_Click(object sender, EventArgs e)
        {
            con.Open();
            if (drppublication.SelectedIndex == 0)
            {

                lblmsg.Text = "Select Publication !!";
                lblmsg.ForeColor = System.Drawing.Color.Red; MultiView1.ActiveViewIndex = -1;
            }
            else if (drpbook.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Book !!";
                lblmsg.ForeColor = System.Drawing.Color.Red; MultiView1.ActiveViewIndex = -1;
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
                var data = connect_Db.Book_Report_Select(Convert.ToInt32(drpbook.SelectedItem.Value), con);
                lblbname.Text = data.Tables[0].Rows[0]["BookName"].ToString();
                lblauthor.Text = data.Tables[0].Rows[0]["AuthorName"].ToString();
                lblbran.Text = data.Tables[0].Rows[0]["Branch"].ToString();
                lblpub.Text = data.Tables[0].Rows[0]["Publication"].ToString();
                lblprice.Text = data.Tables[0].Rows[0]["price"].ToString();
                lblqnt.Text = data.Tables[0].Rows[0]["Quantity"].ToString();
                lblaqnt.Text = data.Tables[0].Rows[0]["Available_Qty"].ToString();
                lblrqnt.Text = data.Tables[0].Rows[0]["Rent"].ToString();
                lbldetail.Text = data.Tables[0].Rows[0]["BookDetails"].ToString();
                Image2.ImageUrl = data.Tables[0].Rows[0]["Picture"].ToString();

                drpstudent.Items.Clear();
                drpstudent.Items.Insert(0, "SELECT");
            }
            con.Close();
        }
        protected void drpbranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpbranch.SelectedIndex == 0)
            {
                lblmsg.Text = "Select Branch and Student name !!";
            }
            else
            {
                con.Open();
                var name = connect_Db.Student_Branch_Select(drpbranch.SelectedItem.Value, con);
                drpstudent.DataSource = name;
                drpstudent.DataTextField = "StudentName";
                drpstudent.DataValueField = "Id";
                drpstudent.DataBind();
                drpstudent.Items.Insert(0, "SELECT");
                lblmsg.Text = "";
                con.Close();
            }
        }
        protected void btnissue_Click(object sender, EventArgs e)
        {
            con.Open();
            try
            {
                if (TextBox1.Text == "")
                {
                    lblissue.Text = "Enter Days !!";
                }
                else
                {
                    if (Convert.ToInt32(lblaqnt.Text) == 0)
                    {
                        lblissue.Text = "Book Stock Empty !!";
                    }
                    else
                    {
                        var data2 = connect_Db.Select_IBook_Row(lblbname.Text, Convert.ToInt32(drpstudent.SelectedValue),null, con);

                        if (data2.Tables[0].Rows.Count != 0)
                        {
                            lblissue.Text = "Student can't get copies of same book !!";
                        }
                        else
                        {

                            var data1 = connect_Db.Select_IBook_Row(null,Convert.ToInt32(drpstudent.SelectedValue),null, con);
                            if (data1.Tables[0].Rows.Count == 3)
                            {
                                lblissue.Text = "A student has maximum 3 books !!";
                            }
                            else
                            {
                                DateTime dateTime = DateTime.Now;
                                connect_Db.Issue_Book_Insert(Convert.ToInt32(drpbook.SelectedValue),lblbname.Text, Convert.ToInt32(drpstudent.SelectedValue),drpstudent.SelectedItem.Text,drpbranch.SelectedValue,drppublication.SelectedValue, Convert.ToInt32(TextBox1.Text), dateTime.ToString("dd/MM/yyyy"),con);

                                lblissue.Text = "Book Issued to " + drpstudent.SelectedItem.Text;

                                var data = connect_Db.Book_Report_Select(Convert.ToInt32(drpbook.SelectedItem.Value), con);
                                lblbname.Text = data.Tables[0].Rows[0]["BookName"].ToString();
                                lblauthor.Text = data.Tables[0].Rows[0]["AuthorName"].ToString();
                                lblbran.Text = data.Tables[0].Rows[0]["Branch"].ToString();
                                lblpub.Text = data.Tables[0].Rows[0]["Publication"].ToString();
                                lblprice.Text = data.Tables[0].Rows[0]["price"].ToString();
                                lblqnt.Text = data.Tables[0].Rows[0]["Quantity"].ToString();
                                lblaqnt.Text = data.Tables[0].Rows[0]["Available_Qty"].ToString();
                                lblrqnt.Text = data.Tables[0].Rows[0]["Rent"].ToString();
                                lbldetail.Text = data.Tables[0].Rows[0]["BookDetails"].ToString();
                                Image2.ImageUrl = data.Tables[0].Rows[0]["Picture"].ToString();

                                TextBox1.Text = "";
                                drpstudent.Items.Clear();
                                drpstudent.Items.Insert(0, "SELECT");
                                var branch = connect_Db.Branch_Select(con);
                                drpbranch.DataSource = branch;
                                drpbranch.DataTextField = "BranchName";
                                drpbranch.DataValueField = "Id";
                                drpbranch.DataBind();
                                drpbranch.Items.Insert(0, "SELECT");
                            }
                        }
                    }
                }
            }
            catch
            {
                lblissue.Text = "Sorry !!! Error !!!";
            }
        }
    }
}