<%@ Page Title="Detalle del Usuario" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DetalleUsuario.aspx.vb" Inherits="GEO.DetalleUsuario" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<%@ Import Namespace="GEO" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%----------------------------   SCRIPTS  -------------------------------------------------------------------------------%>
    <script type="text/javascript">

</script>
    <%--<link href="../Content/SpecialRadioCheckBox.css" rel="stylesheet" />--%>
    <link href="../Login/LoginMessage.css" rel="stylesheet" />
    <link href="../Content/SwitchButtons.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel ID="updpnlMainContent" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
        <ContentTemplate>

            <%----------------------------   Panel Modal  ---------------------------------------------------------------------------%>
            <asp:Panel ID="pnlModalBackground" runat="server" CssClass="overlay" Visible="False"></asp:Panel>
            <asp:Panel ID="pnlWarningMessage" runat="server" CssClass="modalCenter400fixed" Visible="False">
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblWarningTitle" Text="Aviso" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnCloseWarning" Text="&times;" CssClass="closebtn" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblWarningMessage" Text="" CssClass="WarningMessage"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>

            <%----------------------------   Message  -------------------------------------------------------------------------------%>
            <asp:Panel ID="pnlMessage" runat="server" CssClass="MainMessageScreenContainer" Visible="False">
                <asp:ImageButton ID="imgMessage" runat="server" ImageUrl="~/Images/Exclamation32.png" CssClass="MessageImage" />
                <asp:Label ID="lblMessage" runat="server" Text="" CssClass="MessageScreen"></asp:Label>
                <asp:Button runat="server" ID="btnCloseMessage" Text="&times;" CssClass="closebtn" />
            </asp:Panel>
            <%----------------------------   Notificacion  -------------------------------------------------------------------------------%>
            <asp:Panel runat="server" ID="pnlGlobalNotification" CssClass="ctrl" Visible="false">
                <asp:Label ID="lblGlobalNotification" runat="server" Text="&nbsp;" CssClass="messageNotification animateOpen"></asp:Label>
            </asp:Panel>

            <%----------------------------   Cuerpo  --------------------------------------------------------------------------------%>
            <asp:Panel runat="server" CssClass="VerticalSpace NoBorder" HorizontalAlign="Center">

                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" CssClass="VerticalSpace">

                            <asp:Table runat="server" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" Width="30%" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="ID:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell Width="60%">
                                        <asp:TextBox runat="server" ID="txtEditUsuarioID" CssClass="DetailPreguntaGetValues" Enabled="false"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="Nombre:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtEditUsuarioNombre" TextMode="SingleLine" MaxLength="80" CssClass="DetailPreguntaGetValues" Width="99%"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="Usuario:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtEditUsuarioUsuario" Text="" CssClass="DetailPreguntaGetValues" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="Contraseña" ToolTip="La contraseña debe contener mayúsculas, minúsculas, números y símbolos. Mínimo 8 caracteres"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Table runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell Width="99%" HorizontalAlign="Left">
                                                    <asp:TextBox ID="txtEditUsuarioPassword" runat="server" Text="" TextMode="Password" CssClass="DetailPreguntaGetValues" MaxLength="60" Width="99%" Pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,60}$" title="La contraseña debe contener mayúsculas, minúsculas, números y símbolos. Mínimo 8 caracteres"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell Width="1%" VerticalAlign="Middle">
                                                    <asp:ImageButton ID="btnShowPassword" runat="server" ImageUrl="~/Images/eye32.png" ToolTip="Visualiza/Oculta la contraseña" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </asp:TableCell>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="Verificar contraseña"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell CssClass="DatoContainer">
                                        <asp:TextBox ID="txtRepeatPassword" runat="server" Text="" TextMode="Password" CssClass="DetailPreguntaGetValues" MaxLength="60" Width="99%" Pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,60}$" title="La contraseña debe contener mayúsculas, minúsculas, números y símbolos. Mínimo 8 caracteres"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="Rol:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="cboEditUsuarioRol" DataTextField="NombreRolProp" DataValueField="idRolProp" CssClass="DetailPreguntaGetValues" AutoPostBack="true">
                                            <asp:ListItem Text="Cliente" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Administrador" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Survey user" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="Cliente:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="cboEditUsuarioCliente" DataTextField="AliasProp" DataValueField="idClienteProp" CssClass="DetailPreguntaGetValues">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="Activo:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:CheckBox runat="server" ID="chkEditUsuarioEstado" Text="&nbsp;" CssClass="DetailPreguntaGetValues NoBorder" />
                                    </asp:TableCell>
                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                    <asp:TableCell Width="100%" HorizontalAlign="Center" ColumnSpan="2">
                                        <asp:Panel ID="pnlMessageEditUsuario" runat="server" CssClass="MessageScreenContainer" Visible="False">
                                            <asp:Label runat="server" ID="lblMessageAddNombreUsuario" Text="" CssClass="MessageScreen"></asp:Label>
                                        </asp:Panel>
                                    </asp:TableCell>
                                    <asp:TableCell >&nbsp;</asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Table runat="server" Width="100%" CssClass="VerticalSpace">
                                <asp:TableRow>
                                    <asp:TableCell Width="35%">&nbsp;</asp:TableCell>
                                    <asp:TableCell Width="60%" HorizontalAlign="Left">
                                        <asp:Button runat="server" ID="btnGuardarEditUsuario" Text="G u a r d a r" CssClass="detailBotonAction" />
                                    </asp:TableCell>
                                    <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Table runat="server" Width="100%" CssClass="VerticalSpace">
                                <asp:TableRow>
                                    <asp:TableCell Width="25%" HorizontalAlign="Center" CssClass="">
                                        <asp:Label runat="server" ID="lblDataCreadoPor" Text="" CssClass="DetailInfoData"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell Width="25%" HorizontalAlign="Center">
                                        <asp:Label runat="server" ID="lblDataFechaRegistro" Text="" CssClass="DetailInfoData"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell Width="25%" HorizontalAlign="Center">
                                        <asp:Label runat="server" ID="lblDataModificadoPor" Text="" CssClass="DetailInfoData"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell Width="25%" HorizontalAlign="Center">
                                        <asp:Label runat="server" ID="lblDataFechaModificacion" Text="" CssClass="DetailInfoData"></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Center">
                                        <asp:Label runat="server" Text="Creado Por" CssClass="DetailInfoLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Center">
                                        <asp:Label runat="server" Text="Registrado" CssClass="DetailInfoLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Center">
                                        <asp:Label runat="server" Text="Modificado por" CssClass="DetailInfoLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Center">
                                        <asp:Label runat="server" Text="Última modificación" CssClass="DetailInfoLabel"></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
