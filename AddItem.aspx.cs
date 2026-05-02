using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LostAndFoundHub
{
    public partial class AddItem : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string imagePath = "";
                    if (fuImage.HasFile)
                    {
                        string fileName = Path.GetFileName(fuImage.FileName);
                        string folderPath = Server.MapPath("~/Images/");
                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }
                        imagePath = "~/Images/" + fileName;
                        fuImage.SaveAs(folderPath + fileName);
                    }

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO Items (ItemName, Description, Category, Location, Status, ImagePath) VALUES (@ItemName, @Description, @Category, @Location, @Status, @ImagePath)";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@ItemName", txtItemName.Text.Trim());
                            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                            cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
                            cmd.Parameters.AddWithValue("@Location", txtLocation.Text.Trim());
                            cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                            cmd.Parameters.AddWithValue("@ImagePath", imagePath);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    lblMessage.Text = "Item added successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    ClearForm();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        private void ClearForm()
        {
            txtItemName.Text = "";
            txtDescription.Text = "";
            txtLocation.Text = "";
            ddlCategory.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
        }
    }
}
