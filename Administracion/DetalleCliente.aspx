<%@ Page Title="Detalle del Cliente" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DetalleCliente.aspx.vb" Inherits="GEO.DetalleCliente" %>
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

    <%----------------------------   Panel Modal  ---------------------------------------------------------------------------%>
    <asp:Panel ID="pnlSubeLogoWindow" runat="server" CssClass="modalCenter400fixed" Visible="False">
        <asp:Table runat="server" Width="100%">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent">
                    <asp:Label runat="server" Text="Subir imagen" CssClass="WarningTitle"></asp:Label>
                    <asp:Button runat="server" ID="btnCloseSubeLogo" Text="&times;" CssClass="closebtn" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center">
                    <asp:FileUpload runat="server" ID="fupUploadLogo" CssClass="DetailPreguntaUploadLogo"  /> <%--Width="156px"--%>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Panel ID="pnlMessageUploadLogo" runat="server" CssClass="MessageScreenContainer" Visible="False">
                        <asp:Label runat="server" ID="lblMessageUploadLogo" Text="" CssClass="MessageScreen"></asp:Label>
                    </asp:Panel>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center">
                    <asp:Button runat="server" ID="btnSubeLogoConfirmaSi" Text="Subir imagen" CssClass="botonAction" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>

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
                                    <asp:TableCell Width="3%">&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" Width="27%" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="ID:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell Width="45%">
                                        <%--<asp:Label runat="server" ID="lblIdCliente" Text="0" CssClass="DetailPreguntaGetValues showColorBackGray"></asp:Label>--%>
                                        <asp:TextBox runat="server" ID="txtIdCliente" Text="0" CssClass="DetailPreguntaGetValues" Enabled="false"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell Width="25%" RowSpan="10" VerticalAlign="Middle" CssClass="DetailPreguntaGetLogoContent">
                                        <asp:Table runat="server" HorizontalAlign="Center">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label runat="server" Text="Imagen del cliente" CssClass="DetailPreguntaGetValues"></asp:Label>
                                                    <br />&nbsp;
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell HorizontalAlign="Center">
                                                    <asp:UpdatePanel ID="uppnlImagenLogo" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                                        <ContentTemplate>
                                                            <asp:Image runat="server" ID="imgLogoCliente" ImageUrl="~/Images/gSystems_w64x64.png" Width="64px" Height="64px" CssClass="DetailPreguntaGetLogo" />
                                                        </ContentTemplate>
<%--                                                        <Triggers>
                                                            <asp:PostBackTrigger ControlID="imgLogoCliente" />
                                                        </Triggers>--%>
                                                    </asp:UpdatePanel>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell HorizontalAlign="Center">
                                                    <asp:ImageButton runat="server" ID="btnUploadLogo" ImageUrl="~/Images/uploadImage32.png" ToolTip="Subir imagen" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="Razón social:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtEditClienteRazonSocial" TextMode="SingleLine" MaxLength="80" Width="98%" CssClass="DetailPreguntaGetValues"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="Alias:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtEditClienteAlias" TextMode="SingleLine" MaxLength="20" CssClass="DetailPreguntaGetValues" ></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="Número máximo de encuestas:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="cboEditClienteLimiteEncuestas" CssClass="DetailPreguntaGetValues">
                                            <asp:ListItem Text="(default)" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                            <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                            <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                            <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                            <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                            <asp:ListItem Text="Ilimitada" Value="9999"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="Vigencia:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtEditClienteVigencia" TextMode="Date" CssClass="DetailPreguntaGetValues" ></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                                        <asp:Label runat="server" Text="Activo:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:CheckBox runat="server" ID="chkEditClienteEstado" Text="&nbsp;" CssClass="DetailPreguntaGetValues NoBorder" />
                                    </asp:TableCell>
                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell Width="100%" HorizontalAlign="Center" ColumnSpan="4">
                                        <asp:Panel ID="pnlMessageAddCliente" runat="server" CssClass="MessageScreenContainer" Visible="False">
                                            <asp:Label runat="server" ID="lblMessageAddNombreCliente" Text="" CssClass="MessageScreen"></asp:Label>
                                        </asp:Panel>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Table runat="server" Width="100%" CssClass="VerticalSpace">
                                <asp:TableRow>
                                    <asp:TableCell Width="30%">&nbsp;</asp:TableCell>
                                    <asp:TableCell Width="45%" HorizontalAlign="Left">
                                        <asp:Button runat="server" ID="btnGuardarAddCliente" Text="G u a r d a r" CssClass="detailBotonAction" />
                                    </asp:TableCell>
                                    <asp:TableCell Width="25%">&nbsp;</asp:TableCell>
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
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUploadLogo" />
</Triggers>
    </asp:UpdatePanel>

</asp:Content>
