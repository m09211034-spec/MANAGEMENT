using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LostAndFoundHub
{
    public partial class ManageItems : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid(string searchTerm = "")
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Items";
                if (!string.IsNullOrEmpty(searchTerm))
                {
                    query += " WHERE ItemName LIKE @search OR Category LIKE @search";
                }

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        cmd.Parameters.AddWithValue("@search", "%" + searchTerm + "%");
                    }

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvItems.DataSource = dt;
                        gvItems.DataBind();
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid(txtSearch.Text.Trim());
        }

        protected void gvItems_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int itemId = Convert.ToInt32(gvItems.DataKeys[e.RowIndex].Values["ItemID"]);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Items WHERE ItemID = @ItemID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ItemID", itemId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            BindGrid(txtSearch.Text.Trim());
        }

        protected string GetStatusBadgeClass(string status)
        {
            if (string.IsNullOrEmpty(status)) return "bg-secondary";

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
    }
}
