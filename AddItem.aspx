<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddItem.aspx.cs" Inherits="LostAndFoundHub.AddItem" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Item - Lost & Found Hub</title>
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
                        <h1 class="h2">Add New Item</h1>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <a href="ManageItems.aspx" class="btn btn-secondary">Back to List</a>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-10 col-lg-8">
                            <div class="card shadow-sm">
                                <div class="card-body">
                                    <div class="mb-3">
                                        <label for="txtItemName" class="form-label">Item Name</label>
                                        <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control" placeholder="e.g., iPhone 13, Blue Wallet"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvItemName" runat="server" ControlToValidate="txtItemName"
                                            ErrorMessage="Item Name is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="mb-3">
                                        <label for="txtDescription" class="form-label">Description</label>
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Provide details about the item..."></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                                            ErrorMessage="Description is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="ddlCategory" class="form-label">Category</label>
                                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                                                <asp:ListItem Value="" Text="Select Category"></asp:ListItem>
                                                <asp:ListItem Value="Electronics" Text="Electronics"></asp:ListItem>
                                                <asp:ListItem Value="Pets" Text="Pets"></asp:ListItem>
                                                <asp:ListItem Value="Personal Accessories" Text="Personal Accessories"></asp:ListItem>
                                                <asp:ListItem Value="Bags" Text="Bags"></asp:ListItem>
                                                <asp:ListItem Value="Documents" Text="Documents"></asp:ListItem>
                                                <asp:ListItem Value="Others" Text="Others"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory" InitialValue=""
                                                ErrorMessage="Category is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="ddlStatus" class="form-label">Status</label>
                                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                                <asp:ListItem Value="" Text="Select Status"></asp:ListItem>
                                                <asp:ListItem Value="Lost" Text="Lost"></asp:ListItem>
                                                <asp:ListItem Value="Found" Text="Found"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="ddlStatus" InitialValue=""
                                                ErrorMessage="Status is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="txtLocation" class="form-label">Location</label>
                                        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Where was it lost or found?"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="txtLocation"
                                            ErrorMessage="Location is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="mb-3">
                                        <label for="fuImage" class="form-label">Item Image</label>
                                        <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
                                        <asp:RequiredFieldValidator ID="rfvImage" runat="server" ControlToValidate="fuImage"
                                            ErrorMessage="Please upload an image" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="mt-4">
                                        <asp:Button ID="btnSave" runat="server" Text="Save Item" CssClass="btn btn-primary px-4" OnClick="btnSave_Click" />
                                        <a href="ManageItems.aspx" class="btn btn-outline-secondary px-4 ms-2">Cancel</a>
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
