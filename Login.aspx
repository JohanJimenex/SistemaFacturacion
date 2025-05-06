<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaFacturacion.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema Control de Inventario</title>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
</head>
<body class="d-flex align-items-center justify-content-center min-vh-100 bg-dar background">
    <form id="form1" runat="server">
        <div class="card bg-dark text-white p-4 shadow-lg" style="width: 22rem; border-radius: 1rem;">

            <h4 class="text-center mb-3 text-warning">
                Sistema <br /> Control de Inventario
            </h4>
            <h5 class="text-center mb-4">Iniciar Sesión</h5>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger text-center d-block mb-2"></asp:Label>

            <div class="mb-3">
                <asp:Label ID="lblUsername" runat="server" Text="Usuario:" CssClass="form-label" AssociatedControlID="txtUsername" />
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control bg-secondary text-white border-0" />
            </div>

            <div class="mb-3">
                <asp:Label ID="lblPassword" runat="server" Text="Contraseña:" CssClass="form-label" AssociatedControlID="txtPassword" />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control bg-secondary text-white border-0" />
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" CssClass="btn btn-warning w-100 fw-bold" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
