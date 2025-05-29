<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="GEO.Login" Title="Login" %>

<%@ Import Namespace="GEO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%: Page.Title %> - <%: Definiciones.AppShortName %></title>
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="LoginStylesPage.css" rel="stylesheet" />
    <link href="LoginMessage.css" rel="stylesheet" />
</head>
<body>
    <form id="LoginForm" runat="server">

        <%----------------------------   SCRIPTS  -------------------------------------------------------------------------------%>
        <asp:ScriptManager runat="server" EnablePartialRendering="true" AsyncPostBackTimeout="300" AjaxFrameworkMode="Enabled">
            <Scripts>
                <%--Scripts de Framework--%>
                <%--<asp:ScriptReference Name="MsAjaxBundle" />--%>
<%--                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="jquery.ui.combined" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />--%>
                <%--Scripts del sitio--%>
            </Scripts>
        </asp:ScriptManager>

        <script type="text/javascript">

            function clickOnce(btn, msg) {
                btn.value = msg;
                btn.disabled = true;
                return true;
            }

        </script>

        <asp:UpdatePanel ID="updpnlMainContent" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
            <ContentTemplate>

                <%----------------------------   Panel Modal  ---------------------------------------------------------------------------%>
                <asp:Panel ID="pnlModalBackground" runat="server" CssClass="overlay" Visible="False"></asp:Panel>
                <asp:Panel ID="pnlChangePasswordWindow" runat="server" CssClass="MiddleModalAuto" Visible="False">
                    <asp:Table runat="server" Width="100%" CssClass="ModalTitleContainer">
                        <asp:TableRow>
                            <asp:TableCell Width="90%">
                                <asp:Label runat="server" Text="&nbsp;Usuario nuevo - Cambiar contraseña"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell Width="10%" HorizontalAlign="Right">
                                <asp:ImageButton ID="btnCloseChangePassword" runat="server" ImageUrl="~/Images/close_window.w.png" ToolTip="Ignora cambio de contraseña" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Table runat="server" Width="100%" CssClass="ModalMessageContainer">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Table runat="server" Width="95%">
                                    <asp:TableRow CssClass="DatosUsuarioRowSeparateSmall">
                                        <asp:TableCell ColumnSpan="10">&nbsp;</asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell ColumnSpan="10" CssClass="MensajeCambioPassword">
                                            <asp:Label ID="lblMensajeCambioPassword" runat="server" Text="Bienvenido %%Nombre_del_usuario%% a GEO<br>Como medida de seguridad se recomienda cambie la contraseña por una nueva."></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow CssClass="DatosUsuarioRowSeparateSmall">
                                        <asp:TableCell ColumnSpan="10">&nbsp;</asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow CssClass="DatosUsuarioRowSeparateSmall">
                                        <asp:TableCell ColumnSpan="10">&nbsp;</asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell Width="35%" CssClass="DatosUsuarioLabelContent">
                                        <asp:Label runat="server" Text="Nueva contraseña" CssClass="DatosUsuarioLabelSmall" ></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell Width="65%" CssClass="DatosUsuarioInputContent">
                                            <asp:TextBox ID="txtNewPassword" runat="server" Text="" TextMode="Password" CssClass="DatosUsuarioInputSmall"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow CssClass="DatosUsuarioRowSeparateSmall">
                                        <asp:TableCell ColumnSpan="10">&nbsp;</asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="DatosUsuarioLabelContent">
                                        <asp:Label runat="server" Text="Repita la contraseña" CssClass="DatosUsuarioLabelSmall"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell CssClass="DatosUsuarioInputContent">
                                            <asp:TextBox ID="txtNewPasswordValid" runat="server" Text="" TextMode="Password" CssClass="DatosUsuarioInputSmall"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow CssClass="DatosUsuarioRowSeparateSmall">
                                        <asp:TableCell ColumnSpan="10">&nbsp;</asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Panel ID="pnlMessageChangePassword" runat="server" CssClass="MessageScreenContainer" HorizontalAlign="Center">
                        <asp:Label ID="lblMessageChangePassword" runat="server" Text="" CssClass="MessageScreen"></asp:Label>
                    </asp:Panel>
                    <asp:Table runat="server" Width="100%">
                        <asp:TableRow>
                            <asp:TableCell Width="33%">&nbsp;</asp:TableCell>
                            <asp:TableCell Width="34%">
                                <asp:Button runat="server" ID="btnChangePassword" Text="Cambiar contraseña y continuar" CssClass="ButtonBlue" Width="100%" />
                            </asp:TableCell>
                            <asp:TableCell Width="33%">&nbsp;</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="DatosUsuarioRowSeparateSmall">
                            <asp:TableCell>&nbsp;</asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:Panel>
                <asp:Panel ID="pnlSelectCliente" runat="server" CssClass="MiddleModalAuto" Visible="False">
                    <asp:Table runat="server" Width="100%" CssClass="ModalTitleContainer">
                        <asp:TableRow>
                            <asp:TableCell Width="100%">
                                <asp:Label runat="server" Text="&nbsp;Seleccione el Cliente"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Table runat="server" Width="100%" >
                        <asp:TableRow CssClass="DatosUsuarioRowSeparateSmall"><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="ListaLogosSubtitleContent">
                                <asp:Label runat="server" Text="Tiene resultados de más de un Cliente. Seleccione el Cliente que desea consultar" CssClass="ListaLogosSubtitle"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="DatosUsuarioRowSeparateSmall"><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
                    </asp:Table>
                    <asp:Panel runat="server" ScrollBars="Auto" CssClass="MiddleModalAutoMaxHeight" Width="100%">
                        <asp:ListView ID="lstvwListaClientes" runat="server" >
                            <LayoutTemplate>
                                <div runat="server" id="dvListClientes" class="ListaLogos">
                                    <div runat="server" id="itemPlaceholder" />
                                </div>

<%--                                <asp:DataPager ID="lstvwListaClientesPager" runat="server" PageSize="5" Visible="false">
                                    <Fields>
                                        <asp:NextPreviousPagerField
                                            ButtonType="Button"
                                            ShowFirstPageButton="True"
                                            ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>--%>
                            </LayoutTemplate>
                            <ItemTemplate>


                                <%--<asp:Image ID="LogoImage" runat="server" ImageUrl='<%# "~/Login/Logos/" & Eval("idCliente") & Eval("ExtensionLogo") %>' />--%>
                                <asp:Table runat="server" CssClass="ListaLogosContent">
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="ListaLogosImageContent">
                                            <%--<asp:Image ID="LogoImage" runat="server" ImageUrl='<%# Eval("NombreImagenLogoProp") %>' Width="96px" Height="96px" />--%>
                                            <asp:ImageButton ID="btnLogoImage" runat="server" ImageUrl='<%# Eval("NombreImagenLogoProp") %>' Width="96px" Height="96px" ToolTip='<%# Eval("NombreClienteProp") %>' CommandArgument='<%# Eval("idClienteProp") %>' OnClick="btnLogoImage_Click" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="ListaLogosLabelContent">
                                            <asp:Label runat="server" Text='<%# Eval("NombreClienteProp") %>' CssClass="ListaLogosLabel"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
    <%--                            <div class="plainBox" runat="server">
                                    <asp:HyperLink ID="ProductLink" runat="server" Text='<%# Eval("NombreClienteProp") %>'
                                        NavigateUrl='<%# "ProductDetails.aspx?productID=" & Eval("idClienteProp") %>' />
                                    <br />
                                </div>
                                <br />--%>
                            </ItemTemplate>
                        </asp:ListView>
                    </asp:Panel>
                    <asp:Table runat="server" Width="100%">
                        <asp:TableRow CssClass="DatosUsuarioRowSeparateSmall"><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell Width="33%">&nbsp;</asp:TableCell>
                            <asp:TableCell Width="34%">
                                <asp:Button runat="server" ID="btnCancelaSeleccionCliente" Text="Cancelar y regresar" CssClass="ButtonBlue" Width="100%" />
                            </asp:TableCell>
                            <asp:TableCell Width="33%">&nbsp;</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="DatosUsuarioRowSeparateSmall"><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
                    </asp:Table>
                </asp:Panel>

                <%----------------------------   Datos  --------------------------------------------------------------------------------%>
                <asp:Panel runat="server" CssClass="DataContent" Width="100%" Height="100%">


                    <asp:Table runat="server" Width="100%">
                        <asp:TableRow>
                            <asp:TableCell Width="20%">&nbsp;</asp:TableCell>
                            <asp:TableCell Width="60%" HorizontalAlign="Center">
                                <asp:Label runat="server" Text="" CssClass="TitleLabel" ><%: Definiciones.AppShortName %></asp:Label>
                                <%----------------------------   Titulo  ---------------------------------------------------------%>
<%--                                <asp:Table runat="server" Width="100%">
                                    <asp:TableRow>
                                        <asp:TableCell Width="15%">&nbsp;</asp:TableCell>
                                        <asp:TableCell Width="70%" CssClass="TitleContent"> 

                                        </asp:TableCell>
                                        <asp:TableCell Width="15%">&nbsp;</asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>--%>
                            </asp:TableCell>
                            <asp:TableCell Width="20%">&nbsp;</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label ID="lblSubtitle" runat="server" Text="" CssClass="SubTitleStyle"><%: Definiciones.AppDescription %></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                        </asp:TableRow>
<%--                        <asp:TableRow>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Panel runat="server" CssClass="DatosUsuarioContent3">&nbsp;</asp:Panel>
                                <asp:Panel runat="server" CssClass="DatosUsuarioContent2" HorizontalAlign="Center">
                                    <asp:Table runat="server" Width="100%">
                                        <asp:TableRow>
                                            <asp:TableCell HorizontalAlign="Center">
                                                <asp:UpdatePanel ID="uppnlImagenLogo" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Image ID="imgLogo" runat="server" ImageUrl="../Images/gSystems_w128.png" CssClass="LogoStyle"  />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:Panel>
                            </asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                            </asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                        </asp:TableRow>--%>
                    </asp:Table>


                    <%----------------------------   Datos usuario  --------------------------------------------------------------------%>
                    <asp:Table runat="server" Width="100%" CssClass="DatosUsuarioBackFondo" Height="590px">
                        <asp:TableRow>
                            <asp:TableCell CssClass="MarginDatosUsuarioArea">&nbsp;</asp:TableCell>
                            <asp:TableCell CssClass="DatosUsuarioContent" HorizontalAlign="Center">&nbsp;</asp:TableCell>
                            <asp:TableCell CssClass="MarginDatosUsuarioArea">&nbsp;</asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>

                    <asp:Table runat="server" Width="100%" CssClass="DatosUsuarioFowardFondo">
                        <asp:TableRow>
                            <asp:TableCell CssClass="LogoStyleContent" HorizontalAlign="Center" ColumnSpan="3">
                                <asp:UpdatePanel ID="uppnlImagenLogo" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Image ID="imgLogo" runat="server" ImageUrl="../Images/gSystems_w128.png" CssClass="LogoStyle" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell Width="35%">&nbsp;</asp:TableCell>
                            <asp:TableCell Width="30%">

                                <asp:Panel runat="server" CssClass="DatosUsuarioFondo">
                                    <asp:Table runat="server" Width="100%">
                                        <asp:TableRow>
                                            <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                            <asp:TableCell Width="90%" CssClass="DatosUsuarioLabelContent">
                                                <asp:Label runat="server" Text="Usuario" CssClass="DatosUsuarioLabel"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                            <asp:TableCell ID="cellUserName" Width="90%" CssClass="DatosUsuarioInputContent">
                                                <asp:TextBox ID="txtUserName" runat="server" Text="" CssClass="DatosUsuarioInput"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow CssClass="DatosUsuarioRowSeparate">
                                            <asp:TableCell>&nbsp;</asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                            <asp:TableCell Width="90%" CssClass="DatosUsuarioLabelContent">
                                                <asp:Label runat="server" Text="Contraseña" CssClass="DatosUsuarioLabel"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                            <asp:TableCell ID="cellPassword" CssClass="DatosUsuarioInputContent">
                                                <asp:TextBox ID="txtPassword" runat="server" Text="" TextMode="Password" CssClass="DatosUsuarioInput"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow CssClass="DatosUsuarioRowSeparate">
                                            <asp:TableCell>&nbsp;</asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                            <asp:TableCell CssClass="DatosUsuarioLabelContent">
                                                <asp:Label runat="server" Text="Código de verificación" CssClass="DatosUsuarioLabel"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                            <asp:TableCell Width="90%" ID="cellCaptcha" CssClass="DatosUsuarioInputContent">
                                                <asp:Table runat="server" Width="100%">
                                                    <asp:TableRow>
                                                        <asp:TableCell Width="1%">&nbsp;</asp:TableCell>
                                                        <asp:TableCell Width="50%" CssClass="FondoCaptcha">
                                                            <asp:Label ID="lblFormulaCaptcha" runat="server" Text="" CssClass="TextoCaptcha"></asp:Label>
                                                            <asp:ImageButton ID="btnRefreshCaptcha" runat="server" ImageUrl="~/Images/sync.png" ToolTip="Cambiar números" CssClass="ImagenRefrescaCaptcha" />
                                                        </asp:TableCell>
                                                        <asp:TableCell Width="1%">&nbsp;</asp:TableCell>
                                                        <asp:TableCell Width="48%" CssClass="DatosUsuarioInputContent">
                                                            <asp:TextBox ID="txtCaptcha" runat="server" Text="" CssClass="DatosUsuarioInput" MaxLength="3" Width="98%" placeholder="Escriba el resultado" ToolTip="Escriba el resultado"></asp:TextBox>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </asp:TableCell>
                                            <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell></asp:TableCell>
                                            <asp:TableCell ColumnSpan="10">
                                                <asp:Panel runat="server" CssClass="ctrl" ID="lblMessageContainer" Visible="false">
                                                    <asp:Label ID="lblMessage" runat="server" Text="&nbsp;" CssClass="notification animateOpen"></asp:Label>
                                                </asp:Panel>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:Panel>

                                <asp:Table runat="server" Width="100%">
                                    <asp:TableRow>
                                        <asp:TableCell Width="30%">&nbsp;</asp:TableCell>
                                        <asp:TableCell Width="65%" CssClass="DatosUsuarioLinkContent">
                                            <asp:HyperLink ID="lnkResetPassword" runat="server" Text="Olvidé mi contraseña" CssClass="DatosUsuarioLink" NavigateUrl="~/Login/Forgot.aspx"></asp:HyperLink>
                                        </asp:TableCell>
                                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                            <asp:TableCell Width="35%">&nbsp;</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="DatosUsuarioRowSeparate">
                            <asp:TableCell>&nbsp;</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="DatosUsuarioRowSeparate">
                            <asp:TableCell>&nbsp;</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server" Width="100%">
                            <asp:TableCell>&nbsp;</asp:TableCell>
                            <asp:TableCell CssClass="DatosUsuarioButtonContent" HorizontalAlign="Center">
                                <asp:ImageButton ID="btnIngresar" runat="server" ImageUrl="~/Images/botoningresar.png" OnClick="btnIngresar_Click" UseSubmitBehavior="false" CssClass="DatosUsuarioButtonSize" />
                            </asp:TableCell>
                            <asp:TableCell>&nbsp;</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="CopyrightStyleContent" ColumnSpan="3">
                                <asp:Label ID="lblCopyright" runat="server"><%: Definiciones.AppName %> - <%: Definiciones.AppCopyright %> (<%: Definiciones.GetVersionAssembly %>) &nbsp; </asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>

                </asp:Panel>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnIngresar" />
            </Triggers>
        </asp:UpdatePanel>

    </form>
</body>
</html>
