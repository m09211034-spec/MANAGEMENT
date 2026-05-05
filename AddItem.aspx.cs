using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace LostAndFoundHub
{
    public partial class AddItem : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (fuImage.HasFile)
                {
                    try
                    {
                        string fileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(fuImage.FileName);
                        string folderPath = Server.MapPath("~/Images/");

                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }

                        string filePath = "~/Images/" + fileName;
                        fuImage.SaveAs(Server.MapPath(filePath));

                        using (SqlConnection conn = new SqlConnection(connStr))
                        {
                            string sql = "INSERT INTO Items (ItemName, Description, Category, Location, Status, ImagePath, UserID) VALUES (@ItemName, @Description, @Category, @Location, @Status, @ImagePath, @UserID)";
                            using (SqlCommand cmd = new SqlCommand(sql, conn))
                            {
                                cmd.Parameters.AddWithValue("@ItemName", txtItemName.Text.Trim());
                                cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                                cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
                                cmd.Parameters.AddWithValue("@Location", txtLocation.Text.Trim());
                                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                                cmd.Parameters.AddWithValue("@ImagePath", filePath);
                                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                                conn.Open();
                                cmd.ExecuteNonQuery();
                            }
                        }

                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessAlert", "alert('Item added successfully!');", true);
                        ClearFields();
                    }
                    catch (Exception ex)
                    {
                        string errorMessage = ex.Message.Replace("'", "\\'");
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", $"alert('Error: {errorMessage}');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", "alert('Please upload an image.');", true);
                }
            }
        }

        private void ClearFields()
        {
            txtItemName.Text = "";
            txtDescription.Text = "";
            txtLocation.Text = "";
            ddlCategory.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
        }
    }
}
