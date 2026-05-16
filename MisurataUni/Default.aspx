<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MisurataUni.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Misurata University Colleges</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .college-card {
            transition: transform 0.2s;
            cursor: pointer;
        }
        .college-card:hover {
            transform: scale(1.03);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .hero-section {
            background-color: #003366;
            color: white;
            padding: 60px 0;
            margin-bottom: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="Default.aspx">Misurata University</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="Default.aspx">Home</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="ManageColleges.aspx">Admin Dashboard</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <section class="hero-section text-center">
            <div class="container">
                <h1 class="display-4">Explore Our Colleges</h1>
                <p class="lead">Discover the academic opportunities at Misurata University</p>
                <div class="row justify-content-center mt-4">
                    <div class="col-md-6">
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search for colleges..."></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="container mb-5">
            <div class="row">
                <asp:Repeater ID="rptColleges" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 mb-4">
                            <div class="card h-100 college-card">
                                <div class="card-body">
                                    <h5 class="card-title text-primary"><%# Eval("CollegeName") %></h5>
                                    <p class="card-text text-muted"><%# Eval("Description") %></p>
                                </div>
                                <div class="card-footer bg-transparent border-0 mb-2">
                                    <a href="#" class="btn btn-outline-primary btn-sm w-100">View Departments</a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Label ID="lblNoResults" runat="server" Text="No colleges found." CssClass="text-center w-100 fs-5 mt-4" Visible="false"></asp:Label>
            </div>
        </div>

        <footer class="bg-light py-4 mt-auto">
            <div class="container text-center text-muted">
                <p>&copy; 2023 Misurata University. All rights reserved.</p>
            </div>
        </footer>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
