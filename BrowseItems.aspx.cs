using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LostAndFoundHub
{
    public partial class BrowseItems : System.Web.UI.Page
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
            var items = GetMockData();
            rptItems.DataSource = items;
            rptItems.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = txtSearch.Text.Trim().ToLower();
            var items = GetMockData();

            if (!string.IsNullOrEmpty(searchTerm))
            {
                items = items.Where(i =>
                    i.ItemName.ToLower().Contains(searchTerm) ||
                    i.Category.ToLower().Contains(searchTerm) ||
                    i.Location.ToLower().Contains(searchTerm)
                ).ToList();
            }

            rptItems.DataSource = items;
            rptItems.DataBind();

            pnlNoResults.Visible = !items.Any();
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

        private List<ItemViewModel> GetMockData()
        {
            return new List<ItemViewModel>
            {
                new ItemViewModel { ItemName = "iPhone 13 Pro", Category = "Electronics", Location = "Central Park", Status = "Lost", ImageUrl = "https://images.unsplash.com/photo-1632661674596-df8be070a5c5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3", DateReported = DateTime.Now.AddDays(-2) },
                new ItemViewModel { ItemName = "Golden Retriever", Category = "Pets", Location = "Suburban Area", Status = "Found", ImageUrl = "https://images.unsplash.com/photo-1552053831-71594a27632d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3", DateReported = DateTime.Now.AddDays(-1) },
                new ItemViewModel { ItemName = "Leather Wallet", Category = "Personal Accessories", Location = "Downtown Mall", Status = "Lost", ImageUrl = "https://images.unsplash.com/photo-1627123424574-724758594e93?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3", DateReported = DateTime.Now.AddDays(-5) },
                new ItemViewModel { ItemName = "Blue Backpack", Category = "Bags", Location = "University Library", Status = "Found", ImageUrl = "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3", DateReported = DateTime.Now.AddDays(-3) },
                new ItemViewModel { ItemName = "Silver Watch", Category = "Jewelry", Location = "Main Street Gym", Status = "Lost", ImageUrl = "https://images.unsplash.com/photo-1524592094714-0f0654e20314?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3", DateReported = DateTime.Now.AddDays(-10) },
                new ItemViewModel { ItemName = "Car Keys", Category = "Keys", Location = "Airport Terminal", Status = "Found", ImageUrl = "https://images.unsplash.com/photo-1583121274602-3e2820c69888?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3", DateReported = DateTime.Now.AddDays(-4) }
            };
        }
    }

    public class ItemViewModel
    {
        public string ItemName { get; set; }
        public string Category { get; set; }
        public string Location { get; set; }
        public string Status { get; set; }
        public string ImageUrl { get; set; }
        public DateTime DateReported { get; set; }
    }
}
