<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageItems.aspx.cs" Inherits="LostAndFoundHub.ManageItems" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Items - Lost & Found Hub</title>
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
        .item-thumbnail {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 4px;
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
                                <a class="nav-link active" href="ManageItems.aspx">Manage Items</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ManageUsers.aspx">Manage Users</a>
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
                        <h1 class="h2">Manage Items</h1>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <a href="AddItem.aspx" class="btn btn-primary">Add New Item</a>
                        </div>
                    </div>

                    <!-- Search Bar -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="input-group">
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by name or category..."></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-primary" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                    </div>

                    <!-- GridView -->
                    <div class="table-responsive">
                        <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover align-middle"
                            OnRowDeleting="gvItems_RowDeleting" DataKeyNames="ItemID">
                            <Columns>
                                <asp:BoundField DataField="ItemID" HeaderText="ID" />
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <img src='<%# ResolveUrl(Eval("ImagePath").ToString()) %>' alt="Item Image" class="item-thumbnail" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ItemName" HeaderText="Name" />
                                <asp:BoundField DataField="Category" HeaderText="Category" />
                                <asp:BoundField DataField="Location" HeaderText="Location" />
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <span class='badge <%# GetStatusBadgeClass(Eval("Status").ToString()) %>'>
                                            <%# Eval("Status") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="DateReported" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm"
                                            OnClientClick="return confirm('Are you sure?');">Delete</asp:LinkButton>
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
