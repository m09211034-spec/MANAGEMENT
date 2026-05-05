<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrowseItems.aspx.cs" Inherits="LostAndFoundHub.BrowseItems" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Browse Items - Lost & Found Hub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .item-card img {
            height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
            <div class="container">
                <a class="navbar-brand" href="Default.aspx">Lost & Found Hub</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Default.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="BrowseItems.aspx">Browse Items</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AddItem.aspx">Report an Item</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Login.aspx">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Register.aspx">Register</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <h2 class="mb-4">Browse Lost & Found Items</h2>

            <!-- Search Bar -->
            <div class="row mb-5">
                <div class="col-md-8 mx-auto">
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control form-control-lg" placeholder="Search by name, category or location..."></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary btn-lg" OnClick="btnSearch_Click" />
                    </div>
                </div>
            </div>

            <!-- Items Display -->
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <asp:Repeater ID="rptItems" runat="server">
                    <ItemTemplate>
                        <div class="col">
                            <div class="card h-100 item-card shadow-sm">
                                <img src='<%# GetImageUrl(Eval("ImagePath")) %>' class="card-img-top" alt='<%# Eval("ItemName") %>'>
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("ItemName") %></h5>
                                    <p class="card-text">
                                        <strong>Category:</strong> <%# Eval("Category") %><br />
                                        <strong>Location:</strong> <%# Eval("Location") %><br />
                                        <strong>Status:</strong> <span class='badge <%# GetStatusBadgeClass(Eval("Status").ToString()) %>'><%# Eval("Status") %></span>
                                    </p>
                                </div>
                                <div class="card-footer bg-transparent border-top-0">
                                    <small class="text-muted">Reported on <%# Eval("Date", "{0:MMM dd, yyyy}") %></small>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <asp:Panel ID="pnlNoResults" runat="server" Visible="false" CssClass="text-center mt-5">
                <h4>No items found matching your search.</h4>
            </asp:Panel>
        </div>

        <footer class="footer mt-5 py-3 bg-light border-top">
            <div class="container text-center">
                <span class="text-muted">&copy; 2023 Lost & Found Hub</span>
            </div>
        </footer>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
