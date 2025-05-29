<%@ Page Title="Cambio de contraseña" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Forgot.aspx.vb" Inherits="GEO.Forgot" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel ID="updpnlMainContent" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
        <ContentTemplate>

            <%----------------------------   Message  -------------------------------------------------------------------------------%>
            <asp:Panel ID="pnlMessage" runat="server" CssClass="SurveyMessageScreenContainer" Visible="False">
                <asp:ImageButton ID="imgMessage" runat="server" ImageUrl="~/Images/Exclamation32.png" CssClass="MessageImage" />
                <asp:Label ID="lblMessage" runat="server" Text="" CssClass="MessageScreen"></asp:Label>
                <asp:Button runat="server" ID="btnCloseMessage" Text="&times;" CssClass="closebtn" />
            </asp:Panel>
            <%----------------------------   Notificacion  -------------------------------------------------------------------------------%>
            <asp:Panel runat="server" ID="pnlGlobalNotification" CssClass="ctrl" Visible="false">
                <asp:Label ID="lblGlobalNotification" runat="server" Text="&nbsp;" CssClass="messageNotification animateOpen"></asp:Label>
            </asp:Panel>

            <%----------------------------   Cuerpo ---------------------------------------------------------------------------------%>
            <asp:Panel runat="server" ID="pnlCambioPassword" CssClass="VerticalSpace">

                <asp:MultiView ID="mvwCambioPassword" runat="server" ActiveViewIndex="0">

                    <%----------------------------  Usuario -------------------------------------------------------------------------%>
                    <asp:View ID="vwUsuario" runat="server">

                        <asp:Table runat="server" Width="100%">
                            <asp:TableRow Width="100%">
                                <asp:TableCell CssClass="DetailPreguntaGetValuesLabel" Width="20%">
                                    <asp:Label runat="server" Text="Escriba su usuario" CssClass="EtiquetaDato" AssociatedControlID="txtEmail" ToolTip="El usuario debe ser una cuenta de correo electrónico"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell Width="80%">
                                    <asp:TextBox ID="txtEmail" runat="server" Text="" CssClass="DetailPreguntaGetValues" MaxLength="60" AutoCompleteType="Email" TextMode="Email" Width="90%" Pattern="^[a-z0-9-]+(.[a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$" title="El usuario debe ser una cuenta de correo electrónico"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
                        </asp:Table>

                        <asp:Table runat="server" Width="100%">
                            <asp:TableRow>
                                <asp:TableCell Width="20%">&nbsp;</asp:TableCell>
                                <asp:TableCell Width="15%" HorizontalAlign="Right">
                                    <asp:Button ID="btnValidarUsuario" runat="server" Text="Continuar" CssClass="botonAction" Width="100%" />
                                </asp:TableCell>
                                <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                <asp:TableCell Width="15%" HorizontalAlign="Right">
                                    <asp:Button ID="btnDescartar" runat="server" Text="Regresar" CssClass="botonAction" Width="100%" />
                                </asp:TableCell>
                                <asp:TableCell Width="45%">&nbsp;</asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>

                    </asp:View>

                    <%----------------------------  Nueva contraseña ----------------------------------------------------------------%>
                    <asp:View ID="vwNewPassword" runat="server" >
                        <asp:Table runat="server" Width="100%">
                            <asp:TableRow>
                                <asp:TableCell Width="20%">
                                    <asp:Table runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell CssClass="DetailPreguntaGetValuesLabel" Width="100%" >
                                                <asp:Label runat="server" Text="Nueva Contraseña" ToolTip="La contraseña debe contener mayúsculas, minúsculas, números y símbolos. Mínimo 8 caracteres"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell Width="120px" VerticalAlign="Bottom" HorizontalAlign="Center">
                                                <asp:ImageButton ID="btnShowPassword" runat="server" ImageUrl="~/Images/eye32.png" ToolTip="Visualiza/Oculta la contraseña" />
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell CssClass="DatoContainer">
                                    <asp:TextBox ID="txtPassword" runat="server" Text="" TextMode="Password" CssClass="DetailPreguntaGetValues" MaxLength="60" Width="99%" Pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,60}$" title="La contraseña debe contener mayúsculas, minúsculas, números y símbolos. Mínimo 8 caracteres"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell CssClass="DetailPreguntaGetValuesLabel" >
                                    <asp:Label runat="server" Text="Repetir contraseña" ></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell CssClass="DatoContainer" >
                                    <asp:TextBox ID="txtRepeatPassword" runat="server" Text="" TextMode="Password" CssClass="DetailPreguntaGetValues" MaxLength="60" Pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,60}$" title="La contraseña debe contener mayúsculas, minúsculas, números y símbolos. Mínimo 8 caracteres"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
                        </asp:Table>

                        <asp:Table runat="server" Width="100%">
                            <asp:TableRow>
                                <asp:TableCell Width="20%">&nbsp;</asp:TableCell>
                                <asp:TableCell Width="15%" HorizontalAlign="Right">
                                    <asp:Button ID="btnConfirmarCambio" runat="server" Text="Cambiar contraseña" CssClass="botonAction" Width="100%" />
                                </asp:TableCell>
                                <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                                <asp:TableCell Width="15%">
                                    <asp:Button ID="btnRegresar" runat="server" Text="Regresar" CssClass="botonAction" Width="100%" />
                                </asp:TableCell>
                                <asp:TableCell Width="35%">&nbsp;</asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:View>

                    <%----------------------------  Confirmación --------------------------------------------------------------------%>
                    <asp:View ID="vwMensajeConfirmacion" runat="server">

                        <asp:Table runat="server" Width="100%">
                            <asp:TableRow Width="100%">
                                <asp:TableCell CssClass="DetailPreguntaGetValuesLabel" Width="100%">
                                    <asp:Label runat="server" Text="La contraseña se ha actualizado satisfactoriamente." ></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
                        </asp:Table>

                        <asp:Table runat="server" Width="100%">
                            <asp:TableRow>
                                <asp:TableCell Width="15%" HorizontalAlign="Right">
                                    <asp:Button ID="btnSalir" runat="server" Text="Ir al inicio" CssClass="botonAction" Width="100%" />
                                </asp:TableCell>
                                <asp:TableCell Width="85%">&nbsp;</asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>

                    </asp:View>

                </asp:MultiView>

            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
