<%@ Page Title="Administrar Usuarios" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Usuarios.aspx.vb" Inherits="GEO.Usuarios" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<%@ Import Namespace="GEO" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%----------------------------   SCRIPTS  -------------------------------------------------------------------------------%>
    <script type="text/javascript">

</script>

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
            <asp:Panel ID="pnlAddUsuario" runat="server" CssClass="modalCenter400fixed" Visible="False" DefaultButton="btnGuardarAddUsuario" >
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" VerticalAlign="Middle">
                            <asp:Label runat="server" ID="lblAddUsuarioTitle" Text="Agregar usuario" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnAddUsuarioClose" Text="&times;" CssClass="closebtn" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" CssClass="VerticalSpace">
                            <asp:Table runat="server" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right" Width="30%">
                                        <asp:Label runat="server" Text="Nombre:" CssClass="PreguntaLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell Width="70%">
                                        <asp:TextBox runat="server" ID="txtAddUsuarioNombre" TextMode="SingleLine" MaxLength="80" CssClass="PreguntaGetValues" Width="99%" ></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:Label runat="server" Text="Usuario:" CssClass="PreguntaLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtAddUsuarioUsuario" Text="" CssClass="PreguntaGetValues" MaxLength="80" Pattern="^[a-z0-9-]+(.[a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$" title="El usuario debe ser una cuenta de correo electrónico" Width="90%"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:Label runat="server" Text="Contraseña" CssClass="PreguntaLabel" ToolTip="La contraseña debe contener mayúsculas, minúsculas, números y símbolos. Mínimo 8 caracteres"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Table runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell Width="99%" HorizontalAlign="Left">
                                                    <asp:TextBox ID="txtAddUsuarioPassword" runat="server" Text="" TextMode="Password" CssClass="PreguntaGetValues" MaxLength="60" Width="99%" Pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,60}$" title="La contraseña debe contener mayúsculas, minúsculas, números y símbolos. Mínimo 8 caracteres"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell Width="1%" VerticalAlign="Middle">
                                                    <asp:ImageButton ID="btnShowPassword" runat="server" ImageUrl="~/Images/eye32.png" ToolTip="Visualiza/Oculta la contraseña" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </asp:TableCell>
                                </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" Text="Verificar contraseña" CssClass="PreguntaLabel"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="DatoContainer">
                                <asp:TextBox ID="txtRepeatPassword" runat="server" Text="" TextMode="Password" CssClass="PreguntaGetValues" MaxLength="60" Width="99%" Pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,60}$" title="La contraseña debe contener mayúsculas, minúsculas, números y símbolos. Mínimo 8 caracteres"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:Label runat="server" Text="Rol:" CssClass="PreguntaLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="cboAddUsuarioRol" DataTextField="NombreRolProp" DataValueField="idRolProp" CssClass="PreguntaGetValues" AutoPostBack="true">
                                            <asp:ListItem Text="Cliente" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Administrador" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Survey user" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:Label runat="server" Text="Cliente:" CssClass="PreguntaLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="cboAddUsuarioCliente" DataTextField="AliasProp" DataValueField="idClienteProp" CssClass="PreguntaGetValues">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell Width="100%" HorizontalAlign="Center" ColumnSpan="2">
                                        <asp:Panel ID="pnlMessageAddUsuario" runat="server" CssClass="MessageScreenContainer" Visible="False">
                                            <asp:Label runat="server" ID="lblMessageAddNombreUsuario" Text="" CssClass="MessageScreen"></asp:Label>
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
                                    <asp:TableCell Width="40%" HorizontalAlign="Center">
                                        <asp:Button runat="server" ID="btnGuardarAddUsuario" Text="Guardar" CssClass="botonAction" />
                                    </asp:TableCell>
                                    <asp:TableCell Width="30%">&nbsp;</asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <asp:Panel ID="pnlDeleteUsuario" runat="server" CssClass="modalCenter400fixed" Visible="False" DefaultButton="btnDeleteUsuarioDescartar">
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblDeleteUsuarioTitle" Text="Eliminar usuario" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnDeleteUsuarioClose" Text="&times;" CssClass="closebtn" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblDeleteUsuarioMessage" Text="" CssClass="WarningMessage"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                        <asp:TableCell Width="5%" HorizontalAlign="Center">
                            <asp:Button runat="server" ID="btnDeleteUsuarioDescartar" Text="Cancelar" CssClass="botonAction" />
                        </asp:TableCell>
                        <asp:TableCell Width="5%" HorizontalAlign="Center">
                            <asp:Button runat="server" ID="btnDeleteUsuarioConfirmar" Text="Continuar" CssClass="botonAction" />
                        </asp:TableCell>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>

            <%----------------------------   Boton Add usuario  --------------------------------------------------------------------%>
            <asp:Panel runat="server" CssClass="botonTopFlotanteWrapper">
                <asp:Panel runat="server" CssClass="botonTopFlotante" >
                    <asp:ImageButton runat="server" ID="btnAddUsuario" ImageUrl="~/Images/Add64.png" ToolTip="Crear usuario nuevo"/>
                </asp:Panel>
            </asp:Panel>

            <%----------------------------   Buscar  --------------------------------------------------------------------------------%>
            <asp:Panel ID="pnlPageHeader" runat="server" DefaultButton="btnFiltrar" CssClass="VerticalSpace">
                <asp:Table runat="server" Width="33%">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Table runat="server" CssClass="FiltrarContent">
                                <asp:TableRow>
                                    <asp:TableCell Width="10%">
                                        <asp:Label runat="server" Text="Filtrar:" CssClass="FiltrarLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:ImageButton runat="server" ID="btnFiltrar" ImageUrl="~/Images/Buscar24.png" CssClass="FiltrarButton" />
                                    </asp:TableCell>
                                    <asp:TableCell Width="90%">
                                        <asp:TextBox runat="server" Text="" ID="txtFiltroBuscar" Placeholder="Nombre, usuario, rol, cliente..." TextMode="Search" MaxLength="30" CssClass="FiltrarText text100"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
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
            <asp:Panel runat="server" CssClass="GridStyleContainer NoBorder" HorizontalAlign="Center">
                <asp:GridView ID="grdUsuarios" runat="server" AutoGenerateColumns="False" DataKeyNames="idUsuarioProp" EnablePersistedSelection="True" AllowPaging="True" ShowHeaderWhenEmpty="true" ShowHeader="false" EmptyDataText="&nbsp;No hay usuarios con los criterios seleccionados&nbsp;" CssClass="NoBorder VerticalSpace" EmptyDataRowStyle-CssClass="NoBorder GridEmptyDataRowStyle">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Panel runat="server" CssClass="NoBorder" >
                                    <asp:Table runat="server" CellSpacing="4" CellPadding="2" Width="100%" >
                                        <asp:TableRow>
                                            <asp:TableCell Width="1%">&nbsp;</asp:TableCell>
                                            <asp:TableCell Width="98%" CssClass="CellRowContent">
                                                <asp:Table runat="server" Width="100%">
                                                    <asp:TableRow>
                                                        <asp:TableCell ColumnSpan="10" CssClass="CellDataHeader" HorizontalAlign="Left">
                                                            <asp:Label runat="server" ID="lblNombreUsuario" Text='<%# Eval("NombreUsuarioProp") %>' ToolTip='<%# Eval("idUsuarioProp") %>' ></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell Width="40%" CssClass="CellDataValue" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblAliasCliente" Text='<%# Eval("AliasClienteProp", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell Width="60%" CssClass="CellDataValue" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblUsuario" Text='<%# Eval("UsuarioProp") %>'></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell CssClass="CellDataLabel" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblAliasClienteCap" Text="Cliente"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell CssClass="CellDataLabel" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblUsuarioCap" Text="Usuario"></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell CssClass="CellDataValue" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblEstado" Text='<%# Bind("EstadoProp") %>'></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell CssClass="CellDataValue" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblRol" Text='<%# Bind("NombreRolProp") %>'></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell CssClass="CellDataLabel" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblEstadoCap" Text="Estado"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell CssClass="CellDataLabel" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblRolCap" Text="Rol"></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell ColumnSpan="10">
                                                            <asp:Table runat="server" Width="100%">
                                                                <asp:TableRow>
                                                                    <asp:TableCell Width="49%" HorizontalAlign="Center">
                                                                        <asp:ImageButton runat="server" ID="btnEditaUsuario" ImageUrl="~/Images/Edit32w.png" ToolTip="Editar usuario" OnCommand="btnEditaUsuario_Command" CommandName="EditaUsuario" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" /> <%--OnClick="RadioCheckICD(this);"--%>
                                                                    </asp:TableCell>
                                                                    <asp:TableCell Width="2%">&nbsp;</asp:TableCell>
                                                                    <asp:TableCell Width="49%" HorizontalAlign="Center">
                                                                        <asp:ImageButton runat="server" ID="btnDeleteUsuario" ImageUrl="~/Images/Delete32w.png" ToolTip="Eliminar el usuario y todas sus encuestas" CommandName="DeleteUsuario" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnDeleteUsuario_Command" />
                                                                    </asp:TableCell>
                                                                </asp:TableRow>
                                                            </asp:Table>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </asp:TableCell>
                                            <asp:TableCell Width="1%">&nbsp;</asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:Panel>
                            </ItemTemplate>
                            <ItemStyle CssClass="GridListaWrapableItemStyle"  />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="NoBorder GridListaWrapableRow" />
                    <PagerStyle CssClass="GridPagerTextBlock" HorizontalAlign="Center" />
                </asp:GridView>
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="cboAddUsuarioRol" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
