using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LostAndFoundHub
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Logic to save the user to the database
                string name = txtName.Text;
                string email = txtEmail.Text;
                string password = txtPassword.Text;
                string role = ddlRole.SelectedValue;

                // After saving, redirect to the user list
                Response.Redirect("ManageUsers.aspx");
            }
        }
    }
}
