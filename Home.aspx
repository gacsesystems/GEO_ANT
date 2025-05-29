<%@ Page Title="W E L C O M E" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Home.aspx.vb" Inherits="GEO.Home" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Table runat="server" Width="100%" BackColor="White">
        <asp:TableRow Width="100%">
            <asp:TableCell HorizontalAlign="Center" CssClass="MenuTitleContent">
                <asp:Label runat="server" Text="EMPECEMOS" CssClass="MenuTitle"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow Width="100%">
            <asp:TableCell HorizontalAlign="Center" CssClass="MenuTitleContent">
                <asp:Label runat="server" Text="Selecciona una acción" CssClass="MenuSubTitle"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow Height="20px" Width="100%">
            <asp:TableCell>&nbsp;</asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <%----------------------------   Menu Cliente  --------------------------------------------------------------------------------%>
    <asp:Table runat="server" ID="TablaMenuCliente" Width="100%" BackColor="White">
        <asp:TableRow>
            <asp:TableCell Width="29%"></asp:TableCell>
            <asp:TableCell Width="20%" VerticalAlign="Top" CssClass="PaletaGrisClaro">
                <asp:Table runat="server" Width="100%" CssClass="MenuBarContent">
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:ImageButton runat="server" ID="btnAdminEncuestas" ImageUrl="~/Images/Encuestas.png" PostBackUrl="~/Encuestas/Encuestas.aspx" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:Label runat="server" Text="Administrar encuestas" CssClass="MenuBarTitle"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:Label runat="server" Text="Cree encuestas nuevas<br>Diseñe sus encuestas<br>Elimine encuestas" CssClass="MenuBarSubTitle" ></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>&nbsp;</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:ImageButton runat="server" ID="btnAddEncuesta" ImageUrl="~/Images/Add.png" ToolTip="Crear nueva encuesta" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
            <asp:TableCell Width="2%"></asp:TableCell>
            <asp:TableCell Width="20%"  VerticalAlign="Top" CssClass="PaletaGrisClaro">
                <asp:Table runat="server" Width="100%" Height="100%" CssClass="MenuBarContent">
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:ImageButton runat="server" ID="btnReportes" ImageUrl="~/Images/Reportes.png" PostBackUrl="~/Reportes/Cliente/ReportesClientes.aspx" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:Label runat="server" Text="Reportes" CssClass="MenuBarTitle"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:Label runat="server" Text="Consultas en línea<br>Descargue sus reportes<br>Imprima sus reportes" CssClass="MenuBarSubTitle" ></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
            <asp:TableCell Width="29%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <%----------------------------   Menu Administrador  --------------------------------------------------------------------------------%>
    <asp:Table runat="server" ID="TablaMenuAdministrador" Width="100%" BackColor="White">
        <asp:TableRow>
            <asp:TableCell Width="29%"></asp:TableCell>
            <asp:TableCell Width="20%" VerticalAlign="Top" CssClass="PaletaGrisClaro">
                <asp:Table runat="server" Width="100%" CssClass="MenuBarContent">
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:ImageButton runat="server" ID="btnAdminClientes" ImageUrl="~/Images/Clientes.png" PostBackUrl="~/Administracion/Clientes.aspx" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:Label runat="server" Text="Administrar clientes" CssClass="MenuBarTitle"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:Label runat="server" Text="Registre clientes nuevos<br>Cambie las reglas de cada cliente<br>Desactive o active a un cliente<br>Elimine clientes inactivos" CssClass="MenuBarSubTitle" ></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>&nbsp;</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:ImageButton runat="server" ID="btnAddCliente" ImageUrl="~/Images/Add.png" ToolTip="Crear nuevo cliente" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
            <asp:TableCell Width="2%"></asp:TableCell>
            <asp:TableCell Width="20%"  VerticalAlign="Top" CssClass="PaletaGrisClaro">
                <asp:Table runat="server" Width="100%" Height="100%" CssClass="MenuBarContent">
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:ImageButton runat="server" ID="btnAdminUsuarios" ImageUrl="~/Images/Usuarios.png" PostBackUrl="~/Administracion/Usuarios.aspx" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:Label runat="server" Text="Administrar usuarios" CssClass="MenuBarTitle"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:Label runat="server" Text="Agregue usuarios nuevos<br>Inactive usuarios<br>Elimine usuarios" CssClass="MenuBarSubTitle" ></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>&nbsp;</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="100%" HorizontalAlign="Center">
                            <asp:ImageButton runat="server" ID="btnAddUsuario" ImageUrl="~/Images/Add.png" ToolTip="Crear nuevo usuario" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
            <asp:TableCell Width="29%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
