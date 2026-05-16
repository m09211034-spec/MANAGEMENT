using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace MisurataUni
{
    public partial class EditCollege : Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int collegeID;
                    if (int.TryParse(Request.QueryString["id"], out collegeID))
                    {
                        LoadCollegeData(collegeID);
                    }
                    else
                    {
                        Response.Redirect("ManageColleges.aspx");
                    }
                }
                else
                {
                    Response.Redirect("ManageColleges.aspx");
                }
            }
        }

        private void LoadCollegeData(int collegeID)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT CollegeID, CollegeName, Description FROM Colleges WHERE CollegeID = @ID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ID", collegeID);

                conn.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        hfCollegeID.Value = dr["CollegeID"].ToString();
                        txtCollegeName.Text = dr["CollegeName"].ToString();
                        txtDescription.Text = dr["Description"].ToString();
                    }
                    else
                    {
                        Response.Redirect("ManageColleges.aspx");
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int collegeID = int.Parse(hfCollegeID.Value);
                string name = txtCollegeName.Text.Trim();
                string description = txtDescription.Text.Trim();

                try
                {
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        string query = "UPDATE Colleges SET CollegeName = @Name, Description = @Desc WHERE CollegeID = @ID";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Desc", description);
                        cmd.Parameters.AddWithValue("@ID", collegeID);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }

                    Response.Redirect("ManageColleges.aspx");
                }
                catch (Exception ex)
                {
                    string errorMsg = ex.Message.Replace("'", "\\'");
                    ClientScript.RegisterStartupScript(this.GetType(), "UpdateError", $"alert('Error updating record: {errorMsg}');", true);
                }
            }
        }
    }
}
