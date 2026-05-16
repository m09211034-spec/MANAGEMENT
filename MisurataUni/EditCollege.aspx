<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCollege.aspx.cs" Inherits="MisurataUni.EditCollege" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit College - Misurata University</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        function validateForm() {
            var collegeName = document.getElementById('<%= txtCollegeName.ClientID %>').value;
            var description = document.getElementById('<%= txtDescription.ClientID %>').value;

            if (collegeName.trim() === "" || description.trim() === "") {
                alert("Please fill in all required fields.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="Default.aspx">Misurata University</a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="ManageColleges.aspx">Back to Dashboard</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Edit College</h4>
                        </div>
                        <div class="card-body p-4">
                            <asp:HiddenField ID="hfCollegeID" runat="server" />
                            <div class="mb-3">
                                <label for="txtCollegeName" class="form-label">College Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtCollegeName" runat="server" CssClass="form-control" placeholder="Enter college name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCollegeName" runat="server" ControlToValidate="txtCollegeName"
                                    ErrorMessage="College Name is required." CssClass="text-danger small" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="mb-3">
                                <label for="txtDescription" class="form-label">Description <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Enter college description"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                                    ErrorMessage="Description is required." CssClass="text-danger small" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                <a href="ManageColleges.aspx" class="btn btn-outline-secondary me-md-2">Cancel</a>
                                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary px-4" Text="Update College"
                                    OnClientClick="return validateForm();" OnClick="btnUpdate_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
