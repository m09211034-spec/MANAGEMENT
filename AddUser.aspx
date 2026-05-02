<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="LostAndFoundHub.AddUser" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add User - Lost & Found Hub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            min-height: 100vh;
            overflow-x: hidden;
        }
        .sidebar {
            min-height: 100vh;
            background-color: #343a40;
            color: white;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            display: block;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .sidebar a.active {
            background-color: #0d6efd;
        }
        .content {
            padding: 20px;
        }
        .error-message {
            color: red;
            font-size: 0.875em;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <nav class="col-md-3 col-lg-2 d-md-block sidebar collapse">
                    <div class="position-sticky pt-3">
                        <h4 class="px-3">Hub Admin</h4>
                        <ul class="nav flex-column mt-4">
                            <li class="nav-item">
                                <a class="nav-link" href="Dashboard.aspx">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ManageItems.aspx">Manage Items</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="ManageUsers.aspx">Manage Users</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Default.aspx">Logout</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- Main Content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 content">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Add New User</h1>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <a href="ManageUsers.aspx" class="btn btn-secondary">Back to List</a>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8 col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="mb-3">
                                        <label for="txtName" class="form-label">Full Name</label>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter full name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                                            ErrorMessage="Full Name is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="mb-3">
                                        <label for="txtEmail" class="form-label">Email address</label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="name@example.com"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                                            ErrorMessage="Email is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="mb-3">
                                        <label for="txtPassword" class="form-label">Password</label>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                            ErrorMessage="Password is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="mb-3">
                                        <label for="ddlRole" class="form-label">Role</label>
                                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select">
                                            <asp:ListItem Value="" Text="Select Role"></asp:ListItem>
                                            <asp:ListItem Value="Admin" Text="Admin"></asp:ListItem>
                                            <asp:ListItem Value="Supervisor" Text="Supervisor"></asp:ListItem>
                                            <asp:ListItem Value="User" Text="Regular User"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvRole" runat="server" ControlToValidate="ddlRole" InitialValue=""
                                            ErrorMessage="Please select a role" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="mt-4">
                                        <asp:Button ID="btnSave" runat="server" Text="Save User" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
