using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LostAndFoundHub
{
    public partial class ManageItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindItems();
            }
        }

        private void BindItems()
        {
            gvItems.DataSource = GetMockItems();
            gvItems.DataBind();
        }

        protected void gvItems_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // In a real application, we would delete from database here
            // For now, we'll just re-bind mock data
            BindItems();
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

        private List<AdminItemViewModel> GetMockItems()
        {
            return new List<AdminItemViewModel>
            {
                new AdminItemViewModel { ItemID = 1, ItemName = "iPhone 13 Pro", Category = "Electronics", Location = "Central Park", Status = "Lost", ImageUrl = "https://images.unsplash.com/photo-1632661674596-df8be070a5c5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3", DateReported = DateTime.Now.AddDays(-2) },
                new AdminItemViewModel { ItemID = 2, ItemName = "Golden Retriever", Category = "Pets", Location = "Suburban Area", Status = "Found", ImageUrl = "https://images.unsplash.com/photo-1552053831-71594a27632d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3", DateReported = DateTime.Now.AddDays(-1) },
                new AdminItemViewModel { ItemID = 3, ItemName = "Leather Wallet", Category = "Personal Accessories", Location = "Downtown Mall", Status = "Lost", ImageUrl = "https://images.unsplash.com/photo-1627123424574-724758594e93?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3", DateReported = DateTime.Now.AddDays(-5) },
                new AdminItemViewModel { ItemID = 4, ItemName = "Blue Backpack", Category = "Bags", Location = "University Library", Status = "Found", ImageUrl = "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3", DateReported = DateTime.Now.AddDays(-3) }
            };
        }
    }

    public class AdminItemViewModel
    {
        public int ItemID { get; set; }
        public string ItemName { get; set; }
        public string Category { get; set; }
        public string Location { get; set; }
        public string Status { get; set; }
        public string ImageUrl { get; set; }
        public DateTime DateReported { get; set; }
    }
}
