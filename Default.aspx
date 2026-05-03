<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="LostAndFoundHub.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home - Lost & Found Hub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="Default.aspx">Lost & Found Hub</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="Default.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="BrowseItems.aspx">Browse Items</a>
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

        <!-- Hero Section -->
        <div class="bg-light p-5 mb-4 rounded-3 border-bottom">
            <div class="container-fluid py-5 text-center">
                <h1 class="display-5 fw-bold">Welcome to Lost & Found Hub</h1>
                <p class="col-md-8 fs-4 mx-auto">Helping you find what you lost and return what you found. A community-driven platform for reuniting people with their belongings.</p>
                <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                    <a href="BrowseItems.aspx" class="btn btn-primary btn-lg px-4 gap-3">Browse Items</a>
                    <a href="Login.aspx" class="btn btn-outline-secondary btn-lg px-4">Report an Item</a>
                </div>
            </div>
        </div>

        <div class="container mt-5">
            <div class="row text-center">
                <div class="col-md-4">
                    <h3>Search</h3>
                    <p>Search through our extensive database of lost and found items.</p>
                </div>
                <div class="col-md-4">
                    <h3>Report</h3>
                    <p>Easily report items you've found or lost to the community.</p>
                </div>
                <div class="col-md-4">
                    <h3>Reunite</h3>
                    <p>Connect with the owners and help return items to their rightful home.</p>
                </div>
            </div>
        </div>

        <footer class="footer mt-auto py-3 bg-light border-top fixed-bottom">
            <div class="container text-center">
                <span class="text-muted">&copy; 2023 Lost & Found Hub</span>
            </div>
        </footer>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
