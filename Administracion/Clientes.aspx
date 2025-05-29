<%@ Page Title="Administrar Clientes" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Clientes.aspx.vb" Inherits="GEO.Clientes" %>
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
            <asp:Panel ID="pnlAddCliente" runat="server" CssClass="modalCenter400fixed" Visible="False" DefaultButton="btnGuardarAddCliente" >
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" VerticalAlign="Middle">
                            <asp:Label runat="server" ID="lblAddClienteTitle" Text="Agregar cliente" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnAddClienteClose" Text="&times;" CssClass="closebtn" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" CssClass="VerticalSpace">
                            <asp:Table runat="server" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right" Width="30%">
                                        <asp:Label runat="server" Text="Razón social:" CssClass="PreguntaLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell Width="70%">
                                        <asp:TextBox runat="server" ID="txtAddClienteRazonSocial" TextMode="SingleLine" MaxLength="80" CssClass="PreguntaGetValues" Width="99%" ></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:Label runat="server" Text="Alias:" CssClass="PreguntaLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtAddClienteAlias" TextMode="SingleLine" MaxLength="20" CssClass="PreguntaGetValues" ></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:Label runat="server" Text="Número máximo de encuestas:" CssClass="PreguntaLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="cboAddClienteLimiteEncuestas" CssClass="PreguntaGetValues">
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
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:Label runat="server" Text="Vigencia:" CssClass="PreguntaLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtAddClienteVigencia" TextMode="Date" CssClass="PreguntaGetValues" ></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell Width="100%" HorizontalAlign="Center" ColumnSpan="2">
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
                                    <asp:TableCell Width="40%" HorizontalAlign="Center">
                                        <asp:Button runat="server" ID="btnGuardarAddCliente" Text="Guardar" CssClass="botonAction" />
                                    </asp:TableCell>
                                    <asp:TableCell Width="30%">&nbsp;</asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <asp:Panel ID="pnlDeleteCliente" runat="server" CssClass="modalCenter400fixed" Visible="False" DefaultButton="btnDeleteClienteDescartar">
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblDeleteClienteTitle" Text="Eliminar cliente" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnDeleteClienteClose" Text="&times;" CssClass="closebtn" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblDeleteClienteMessage" Text="" CssClass="WarningMessage"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                        <asp:TableCell Width="5%" HorizontalAlign="Center">
                            <asp:Button runat="server" ID="btnDeleteClienteDescartar" Text="Cancelar" CssClass="botonAction" />
                        </asp:TableCell>
                        <asp:TableCell Width="5%" HorizontalAlign="Center">
                            <asp:Button runat="server" ID="btnDeleteClienteConfirmar" Text="Continuar" CssClass="botonAction" />
                        </asp:TableCell>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>

            <%----------------------------   Boton Add cliente  --------------------------------------------------------------------%>
            <asp:Panel runat="server" CssClass="botonTopFlotanteWrapper">
                <asp:Panel runat="server" CssClass="botonTopFlotante" >
                    <asp:ImageButton runat="server" ID="btnAddCliente" ImageUrl="~/Images/Add64.png" ToolTip="Crear cliente nuevo"/>
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
                                        <asp:TextBox runat="server" Text="" ID="txtFiltroBuscar" Placeholder="Buscar..." TextMode="Search" MaxLength="30" CssClass="FiltrarText text100"></asp:TextBox>
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
                <asp:GridView ID="grdClientes" runat="server" AutoGenerateColumns="False" DataKeyNames="idClienteProp" EnablePersistedSelection="True" AllowPaging="True" ShowHeaderWhenEmpty="true" ShowHeader="false" EmptyDataText="&nbsp;No hay clientes con los criterios seleccionados&nbsp;" CssClass="NoBorder VerticalSpace" EmptyDataRowStyle-CssClass="NoBorder GridEmptyDataRowStyle">
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
                                                            <asp:Label runat="server" ID="lblNombreCliente" Text='<%# Eval("NombreParte1Prop") %>' ToolTip='<%# Eval("idClienteProp") %>' ></asp:Label>
                                                            <br />
                                                            <asp:Label runat="server" ID="lblNombreCliente2" Text='<%# Eval("NombreParte2Prop") %>' ToolTip='<%# Eval("idClienteProp") %>' CssClass="CellDataHeaderRow2" ></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell Width="50%" CssClass="CellDataValue" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblFechaRegistro" Text='<%# Eval("FechaRegistroProp", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell Width="50%" CssClass="CellDataValue" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblUsuarioRegistro" Text='<%# Eval("AliasProp") %>'></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell CssClass="CellDataLabel" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblFechaRegistroCap" Text="Fecha de registro"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell CssClass="CellDataLabel" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblUsuarioRegistroCap" Text="Nombre corto"></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell Width="50%" CssClass="CellDataValue" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblNumeroPreguntas" Text='<%# Bind("EstadoProp") %>'></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell Width="50%" CssClass="CellDataValue" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblClientesContestadas" Text='<%# Bind("TotalEncuestasProp") %>'></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell CssClass="CellDataLabel" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblNumeroPreguntasCap" Text="Estado"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell CssClass="CellDataLabel" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblClientesContestadasCap" Text="Número de encuestas"></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell ColumnSpan="10">
                                                            <asp:Table runat="server" Width="100%">
                                                                <asp:TableRow>
                                                                    <asp:TableCell Width="49%" HorizontalAlign="Center">
                                                                        <asp:ImageButton runat="server" ID="btnEditaCliente" ImageUrl="~/Images/Edit32w.png" ToolTip="Editar cliente" OnCommand="btnEditaCliente_Command" CommandName="EditaCliente" CommandArgument="<%# CType(Container,GridViewRow).RowIndex %>" /> <%--OnClick="RadioCheckICD(this);"--%>
                                                                    </asp:TableCell>
                                                                    <asp:TableCell Width="2%">&nbsp;</asp:TableCell>
                                                                    <asp:TableCell Width="49%" HorizontalAlign="Center">
                                                                        <asp:ImageButton runat="server" ID="btnDeleteCliente" ImageUrl="~/Images/Delete32w.png" ToolTip="Eliminar el cliente y todas sus encuestas" CommandName="DeleteCliente" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnDeleteCliente_Command" />
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
    </asp:UpdatePanel>

</asp:Content>
