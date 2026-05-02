<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="LostAndFoundHub.ManageUsers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Users - Lost & Found Hub</title>
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
                                <a class="nav-link" href="#">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Manage Items</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="ManageUsers.aspx">Manage Users</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Logout</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- Main Content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 content">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Manage Users</h1>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <a href="AddUser.aspx" class="btn btn-primary">Add New User</a>
                        </div>
                    </div>

                    <!-- Search Section -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row g-3 align-items-center">
                                <div class="col-auto">
                                    <label for="txtSearchUser" class="col-form-label">Search User:</label>
                                </div>
                                <div class="col-auto">
                                    <asp:TextBox ID="txtSearchUser" runat="server" CssClass="form-control" placeholder="Name or Email"></asp:TextBox>
                                </div>
                                <div class="col-auto">
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-secondary" OnClick="btnSearch_Click" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Users GridView -->
                    <div class="table-responsive">
                        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover"
                            OnRowDeleting="gvUsers_RowDeleting" DataKeyNames="UserID">
                            <Columns>
                                <asp:BoundField DataField="UserID" HeaderText="ID" />
                                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="Role" HeaderText="Role" />
                                <asp:BoundField DataField="RegistrationDate" HeaderText="Registration Date" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm"
                                            OnClientClick="return confirm('Are you sure you want to delete this user?');">Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </main>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
