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
    public partial class EditItem : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    LoadItemDetails(Request.QueryString["id"].ToString());
                }
                else
                {
                    Response.Redirect("BrowseItems.aspx");
                }
            }
        }

        private void LoadItemDetails(string itemId)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT * FROM Items WHERE ItemID = @ItemID";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@ItemID", itemId);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        txtItemName.Text = reader["ItemName"].ToString();
                        txtDescription.Text = reader["Description"].ToString();
                        ddlCategory.SelectedValue = reader["Category"].ToString();
                        txtLocation.Text = reader["Location"].ToString();
                        ddlStatus.SelectedValue = reader["Status"].ToString();

                        string imagePath = reader["ImagePath"].ToString();
                        hfImagePath.Value = imagePath;

                        if (!string.IsNullOrEmpty(imagePath))
                        {
                            imgCurrent.ImageUrl = ResolveUrl(imagePath);
                        }
                        else
                        {
                            imgCurrent.ImageUrl = "https://via.placeholder.com/200x150?text=No+Image";
                        }
                    }
                    else
                    {
                        Response.Redirect("BrowseItems.aspx");
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string itemId = Request.QueryString["id"];
                string imagePath = hfImagePath.Value;

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

                        imagePath = "~/Images/" + fileName;
                        fuImage.SaveAs(Server.MapPath(imagePath));
                    }
                    catch (Exception ex)
                    {
                        string errorMessage = ex.Message.Replace("'", "\\'");
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", $"alert('Error uploading image: {errorMessage}');", true);
                        return;
                    }
                }

                try
                {
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        // Explicitly NOT updating Date column as per requirements
                        string sql = "UPDATE Items SET ItemName = @ItemName, Description = @Description, Category = @Category, Location = @Location, Status = @Status, ImagePath = @ImagePath WHERE ItemID = @ItemID";
                        using (SqlCommand cmd = new SqlCommand(sql, conn))
                        {
                            cmd.Parameters.AddWithValue("@ItemName", txtItemName.Text.Trim());
                            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                            cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
                            cmd.Parameters.AddWithValue("@Location", txtLocation.Text.Trim());
                            cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                            cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                            cmd.Parameters.AddWithValue("@ItemID", itemId);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessAlert", "alert('Item updated successfully!'); window.location='BrowseItems.aspx';", true);
                }
                catch (Exception ex)
                {
                    string errorMessage = ex.Message.Replace("'", "\\'");
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", $"alert('Error: {errorMessage}');", true);
                }
            }
        }
    }
}
