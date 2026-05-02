using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LostAndFoundHub
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserData();
            }
        }

        private void BindUserData()
        {
            List<User> users = GetMockUsers();
            gvUsers.DataSource = users;
            gvUsers.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText = txtSearchUser.Text.ToLower();
            List<User> users = GetMockUsers();
            var filteredUsers = users.Where(u => u.FullName.ToLower().Contains(searchText) || u.Email.ToLower().Contains(searchText)).ToList();
            gvUsers.DataSource = filteredUsers;
            gvUsers.DataBind();
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Mock delete logic
            int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
            // In a real app, delete from DB here
            BindUserData();
        }

        private List<User> GetMockUsers()
        {
            return new List<User>
            {
                new User { UserID = 1, FullName = "John Doe", Email = "john@example.com", Role = "Admin", RegistrationDate = DateTime.Now.AddMonths(-5) },
                new User { UserID = 2, FullName = "Jane Smith", Email = "jane@example.com", Role = "Supervisor", RegistrationDate = DateTime.Now.AddMonths(-3) },
                new User { UserID = 3, FullName = "Bob Johnson", Email = "bob@example.com", Role = "User", RegistrationDate = DateTime.Now.AddMonths(-1) }
            };
        }
    }

    public class User
    {
        public int UserID { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }
        public DateTime RegistrationDate { get; set; }
    }
}
