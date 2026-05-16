using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace MisurataUni
{
    public partial class Default : Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindColleges();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindColleges(txtSearch.Text.Trim());
        }

        private void BindColleges(string searchTerm = "")
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Colleges";
                if (!string.IsNullOrEmpty(searchTerm))
                {
                    query += " WHERE CollegeName LIKE @Search OR Description LIKE @Search";
                }
                query += " ORDER BY CollegeName ASC";

                SqlCommand cmd = new SqlCommand(query, conn);
                if (!string.IsNullOrEmpty(searchTerm))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + searchTerm + "%");
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptColleges.DataSource = dt;
                rptColleges.DataBind();

                lblNoResults.Visible = dt.Rows.Count == 0;
            }
        }
    }
}
