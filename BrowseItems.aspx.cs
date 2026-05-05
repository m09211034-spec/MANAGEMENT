using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LostAndFoundHub
{
    public partial class BrowseItems : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindItems();
            }
        }

        private void BindItems(string searchTerm = "")
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT * FROM Items";
                if (!string.IsNullOrEmpty(searchTerm))
                {
                    sql += " WHERE ItemName LIKE @search OR Category LIKE @search OR Location LIKE @search";
                }
                sql += " ORDER BY ItemID DESC";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        cmd.Parameters.AddWithValue("@search", "%" + searchTerm + "%");
                    }

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptItems.DataSource = dt;
                    rptItems.DataBind();

                    pnlNoResults.Visible = dt.Rows.Count == 0;
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindItems(txtSearch.Text.Trim());
        }

        protected string GetStatusBadgeClass(string status)
        {
            switch (status.ToLower())
            {
                case "lost":
                    return "bg-danger";
                case "found":
                    return "bg-success";
                case "returned":
                    return "bg-info text-dark";
                default:
                    return "bg-secondary";
            }
        }

        protected string GetImageUrl(object imagePath)
        {
            if (imagePath == null || string.IsNullOrEmpty(imagePath.ToString()))
            {
                return "https://via.placeholder.com/500x300?text=No+Image+Available";
            }
            return ResolveUrl(imagePath.ToString());
        }
    }
}
