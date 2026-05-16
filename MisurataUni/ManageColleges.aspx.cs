using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MisurataUni
{
    public partial class ManageColleges : Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindColleges();
            }
        }

        private void BindColleges()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT CollegeID, CollegeName, Description FROM Colleges ORDER BY CollegeName ASC";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvColleges.DataSource = dt;
                gvColleges.DataBind();
            }
        }

        protected void gvColleges_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int collegeID = Convert.ToInt32(gvColleges.DataKeys[e.RowIndex].Value);

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "DELETE FROM Colleges WHERE CollegeID = @ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ID", collegeID);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                // Refresh the grid
                BindColleges();
                ClientScript.RegisterStartupScript(this.GetType(), "DeleteSuccess", "alert('Record deleted successfully.');", true);
            }
            catch (Exception ex)
            {
                string errorMsg = ex.Message.Replace("'", "\\'");
                ClientScript.RegisterStartupScript(this.GetType(), "DeleteError", $"alert('Error deleting record: {errorMsg}');", true);
            }
        }
    }
}
