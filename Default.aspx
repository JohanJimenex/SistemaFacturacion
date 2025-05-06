<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SistemaFacturacion._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-4">
        <div class="text-center mb-5">
            <h1 class="display-5 fw-bold text-primary">¡Bienvenido al Sistema de Control de Inventario!</h1>
            <p class="lead">Gestiona productos, bodegas, usuarios y facturación de forma rápida y eficiente.</p>
        </div>

        <div class="row g-4 justify-content-center">
            <!-- Bodegas -->
            <div class="col-md-4">
                <a href="Bodegas.aspx" class="text-decoration-none">
                    <div class="card card-hover h-100 text-white bg-primary shadow text-center p-3">
                        <div class="card-body text-center">
                            <i class="bi bi-box display-4 mb-3"></i>
                            <h5 class="card-title">Bodegas</h5>
                            <p class="card-text">Consulta y gestiona todas las bodegas disponibles.</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Productos -->
            <div class="col-md-4">
                <a href="Productos.aspx" class="text-decoration-none">
                    <div class="card card-hover h-100 text-white bg-success shadow text-center p-3">
                        <div class="card-body text-center">
                            <i class="bi bi-bag-check display-4 mb-3"></i>
                            <h5 class="card-title">Productos</h5>
                            <p class="card-text">Control de inventario de productos disponibles.</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Facturación -->
            <div class="col-md-4">
                <a href="Facturas.aspx" class="text-decoration-none">
                    <div class="card card-hover h-100 text-white bg-danger shadow text-center p-3">
                        <div class="card-body text-center">
                            <i class="bi bi-receipt display-4 mb-3"></i>
                            <h5 class="card-title">Facturación</h5>
                            <p class="card-text">Crea y visualiza facturas de forma ordenada.</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Usuarios -->
            <div class="col-md-4">
                <a href="Usuarios.aspx" class="text-decoration-none">
                    <div class="card card-hover h-100 text-white bg-warning  shadow text-center p-3">
                        <div class="card-body text-center">
                            <i class="bi bi-people-fill display-4 mb-3"></i>
                            <h5 class="card-title">Usuarios</h5>
                            <p class="card-text">Administración de usuarios y accesos.</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</asp:Content>
