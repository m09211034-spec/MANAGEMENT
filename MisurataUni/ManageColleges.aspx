<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageColleges.aspx.cs" Inherits="MisurataUni.ManageColleges" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Colleges - Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="Default.aspx">Misurata University Admin</a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Default.aspx">Public View</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="#"><i class="bi bi-box-arrow-right"></i> Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mt-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Manage Colleges</h2>
                <a href="AddCollege.aspx" class="btn btn-success"><i class="bi bi-plus-circle"></i> Add New College</a>
            </div>

            <div class="card shadow-sm">
                <div class="card-body p-0">
                    <asp:GridView ID="gvColleges" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-hover table-striped mb-0" GridLines="None"
                        DataKeyNames="CollegeID" OnRowDeleting="gvColleges_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="CollegeID" HeaderText="ID" ItemStyle-CssClass="px-4" HeaderStyle-CssClass="px-4" />
                            <asp:BoundField DataField="CollegeName" HeaderText="College Name" ItemStyle-CssClass="fw-bold" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="text-end px-4" HeaderStyle-CssClass="text-end px-4">
                                <ItemTemplate>
                                    <a href='EditCollege.aspx?id=<%# Eval("CollegeID") %>' class="btn btn-sm btn-outline-primary me-1" title="Edit">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete"
                                        CssClass="btn btn-sm btn-outline-danger" title="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this record?');">
                                        <i class="bi bi-trash"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center p-4">
                                <p class="text-muted mb-0">No colleges found in the database.</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
