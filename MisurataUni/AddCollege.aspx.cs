using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace MisurataUni
{
    public partial class AddCollege : Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Future implementation: Check for Admin Session here
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtCollegeName.Text.Trim();
                string description = txtDescription.Text.Trim();

                try
                {
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        string query = "INSERT INTO Colleges (CollegeName, Description) VALUES (@Name, @Desc)";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Desc", description);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }

                    // Success: Redirect to management page
                    Response.Redirect("ManageColleges.aspx");
                }
                catch (Exception ex)
                {
                    // Handle errors (e.g., log them or show an alert)
                    string errorMsg = ex.Message.Replace("'", "\\'");
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", $"alert('Error: {errorMsg}');", true);
                }
            }
        }
    }
}
