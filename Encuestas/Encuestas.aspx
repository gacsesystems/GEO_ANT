<%@ Page Title="Administrar Encuestas" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Encuestas.aspx.vb" Inherits="GEO.Encuestas" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<%@ Import Namespace="GEO" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%----------------------------   SCRIPTS  -------------------------------------------------------------------------------%>
    <script type="text/javascript">

<%--        function RadioCheckICD(rb) {
            var gv = document.getElementById("<%=grdEncuestas.idEncuestaProp%>");
            var rbs = gv.getElementsByTagName("input");
            var row = rb.parentNode.parentNode;
            for (var i = 0; i < rbs.length; i++)
            {
                if (rbs[i].type == "radio")
                {
                    if (rbs[i].checked && rbs[i] != rb)
                    {
                        rbs[i].checked = false;
                        break;
                    }
                }
            }
        }--%>

        function ClipboardCopyText(fxHideElementID) {

            var lxHideElement = document.getElementById(fxHideElementID);

            var lxURL = lxHideElement.value;

            navigator.clipboard.writeText(lxURL).then(function () {
                /* clipboard successfully set */
                alert('URL copiada al portapapeles');
            }, function () {
                /* clipboard write failed */
                alert('No se pudo copiar la URL al portapapeles');
            });
        }

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
            <asp:Panel ID="pnlAddEncuesta" runat="server" CssClass="modalCenter400fixed" Visible="False" DefaultButton="btnGuardarAddEncuesta" >
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" VerticalAlign="Middle">
                            <asp:Label runat="server" ID="lblAddEncuestaTitle" Text="Agregar encuesta" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnAddEncuestaClose" Text="&times;" CssClass="closebtn" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" CssClass="VerticalSpace">
                            <asp:Table runat="server" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:Label runat="server" Text="Nombre:" CssClass="PreguntaLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtAddNombreEncuesta" TextMode="SingleLine" MaxLength="50" CssClass="PreguntaGetValues" ></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell Width="100%" HorizontalAlign="Center" ColumnSpan="2">
                                        <asp:Panel ID="pnlMessageAddEncuesta" runat="server" CssClass="MessageScreenContainer" Visible="False">
                                            <asp:Label runat="server" ID="lblMessageAddNombreEncuesta" Text="" CssClass="MessageScreen"></asp:Label>
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
                                        <asp:Button runat="server" ID="btnGuardarAddEncuesta" Text="Guardar" CssClass="botonAction" />
                                    </asp:TableCell>
                                    <asp:TableCell Width="30%">&nbsp;</asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <asp:Panel ID="pnlDeleteEncuesta" runat="server" CssClass="modalCenter400fixed" Visible="False" DefaultButton="btnDeleteEncuestaDescartar">
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblDeleteEncuestaTitle" Text="Eliminar encuesta" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnDeleteEncuestaClose" Text="&times;" CssClass="closebtn" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblDeleteEncuestaMessage" Text="" CssClass="WarningMessage"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                        <asp:TableCell Width="5%" HorizontalAlign="Center">
                            <asp:Button runat="server" ID="btnDeleteEncuestaDescartar" Text="Cancelar" CssClass="botonAction" />
                        </asp:TableCell>
                        <asp:TableCell Width="5%" HorizontalAlign="Center">
                            <asp:Button runat="server" ID="btnDeleteEncuestaConfirmar" Text="Continuar" CssClass="botonAction" />
                        </asp:TableCell>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <asp:Panel ID="pnlCopyURLEncuesta" runat="server" CssClass="modalCenter400fixed" Visible="False" >
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblCopyURLEncuestaTitle" Text="Copiar URL de la encuesta" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnCopyURLEncuestaClose" Text="&times;" CssClass="closebtn" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" ColumnSpan="4">
                            <asp:TextBox runat="server" ID="txtCopyURLEncuesta" Text="" CssClass="WarningMessage" ReadOnly="true" onfocus="this.select();"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <asp:Panel ID="pnlViewAnswersEncuesta" runat="server" CssClass="modalCenter400fixed" Visible="False" >
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblViewAnswersEncuestaTitle" Text="Respuestas de la encuesta" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnViewAnswersEncuestaClose" Text="&times;" CssClass="closebtn" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top">
                            <asp:GridView runat="server" ID="grdRespuestas" AutoGenerateColumns="False" DataKeyNames="idEncuestaProp" AllowPaging="True" ShowHeaderWhenEmpty="true" ShowHeader="True" EmptyDataText="&nbsp;No hay respuestas para la encuesta seleccionada&nbsp;" CssClass="GridStyle" >
                                <Columns>
                                    <asp:BoundField DataField="CorreoRespuestaEncuestaProp" HeaderText="Cliente usuario" HeaderStyle-Width="20%" />
                                    <asp:BoundField Datafield="NombreSeccionProp" HeaderText="Sección" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="PreguntaProp" HeaderText="Pregunta" HeaderStyle-Width="40%" ItemStyle-HorizontalAlign="Justify"/>
                                    <asp:BoundField DataField="ValorRespuestaProp" HeaderText="Respuesta" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                                </Columns>
                                <RowStyle CssClass="GridRowStyle" />
                                <HeaderStyle CssClass="GridHeaderStyle" />
                                <AlternatingRowStyle CssClass="GridAlternateRow" />
                                <PagerStyle CssClass="GridPagerTextBlock" />
                            </asp:GridView>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>

            <%----------------------------   Boton Add encuesta  --------------------------------------------------------------------%>
            <asp:Panel runat="server" CssClass="botonTopFlotanteWrapper">
                <asp:Panel runat="server" CssClass="botonTopFlotante" >
                    <asp:ImageButton runat="server" ID="btnAddEncuesta" ImageUrl="~/Images/Add64.png" ToolTip="Crear encuesta nueva"/>
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
                <asp:GridView ID="grdEncuestas" runat="server" AutoGenerateColumns="False" DataKeyNames="idEncuestaProp" EnablePersistedSelection="True" AllowPaging="True" ShowHeaderWhenEmpty="true" ShowHeader="false" EmptyDataText="&nbsp;No hay encuestas con los criterios seleccionados&nbsp;" CssClass="NoBorder VerticalSpace" EmptyDataRowStyle-CssClass="NoBorder GridEmptyDataRowStyle">
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
                                                            <asp:Label runat="server" ID="lblNombreEncuesta" Text='<%# Eval("NombreParte1Prop") %>' ToolTip='<%# Eval("idEncuestaProp") %>' ></asp:Label>
                                                            <br />
                                                            <asp:Label runat="server" ID="lblNombreEncuesta2" Text='<%# Eval("NombreParte2Prop") %>' ToolTip='<%# Eval("idEncuestaProp") %>' CssClass="CellDataHeaderRow2" ></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell Width="50%" CssClass="CellDataValue" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblFechaRegistro" Text='<%# Eval("FechaRegistroProp", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell Width="50%" CssClass="CellDataValue" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblUsuarioRegistro" Text='<%# Eval("CreadaPorProp") %>'></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell CssClass="CellDataLabel" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblFechaRegistroCap" Text="Fecha de registro"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell CssClass="CellDataLabel" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblUsuarioRegistroCap" Text="Creado por"></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell Width="50%" CssClass="CellDataValue" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblNumeroPreguntas" Text='<%# Bind("TotPreguntasProp") %>'></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell Width="50%" CssClass="CellDataValue" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblEncuestasContestadas" Text='<%# Bind("EncuestasContestadasProp") %>'></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell CssClass="CellDataLabel" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblNumeroPreguntasCap" Text="# Preguntas"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell CssClass="CellDataLabel" HorizontalAlign="Center">
                                                            <asp:Label runat="server" ID="lblEncuestasContestadasCap" Text="#Encuestas contestadas"></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell ColumnSpan="10">
                                                            <asp:Table runat="server" Width="100%">
                                                                <asp:TableRow>
                                                                    <asp:TableCell Width="19%" HorizontalAlign="Center">
                                                                        <asp:ImageButton runat="server" ID="btnEditaEncuesta" ImageUrl="~/Images/Edit32w.png" ToolTip="Editar encuesta" OnClick="btnEditaEncuesta_Click" CommandName="EditaEncuesta" CommandArgument="<%# CType(Container,GridViewRow).RowIndex %>" /> <%--OnClick="RadioCheckICD(this);"--%>
                                                                    </asp:TableCell>
                                                                    <asp:TableCell Width="2%">&nbsp;</asp:TableCell>
                                                                    <asp:TableCell Width="18%" HorizontalAlign="Center">
                                                                        <asp:ImageButton runat="server" ID="btnViewEncuestas" ImageUrl="~/Images/View32.png" ToolTip="Consultar las respuestas" CommandName="ViewAnswers" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnViewEncuestas_Command" />
                                                                    </asp:TableCell>
                                                                    <asp:TableCell Width="2%">&nbsp;</asp:TableCell>
                                                                    <asp:TableCell Width="18%" HorizontalAlign="Center">
                                                                        <asp:ImageButton runat="server" ID="btnDeleteEncuesta" ImageUrl="~/Images/Delete32w.png" ToolTip="Eliminar la encuesta y todas sus respuestas" CommandName="DeleteEncuesta" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnDeleteEncuesta_Command" />
                                                                    </asp:TableCell>
                                                                    <asp:TableCell Width="2%">&nbsp;</asp:TableCell>
                                                                    <asp:TableCell Width="18%" HorizontalAlign="Center">
                                                                        <asp:ImageButton runat="server" ID="btnPreviewEncuesta" ImageUrl="~/Images/preview32.png" ToolTip="Previsualizar encuesta" CommandName="Preview" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnPreviewEncuesta_Command"/>
                                                                    </asp:TableCell>
                                                                    <asp:TableCell Width="2%">&nbsp;</asp:TableCell>
                                                                    <asp:TableCell Width="19%" HorizontalAlign="Center">
                                                                        <asp:ImageButton runat="server" ID="btnClipboardCopyURL" ImageUrl="~/Images/link32.png" ToolTip="Obtener la URL de la encuesta" CommandName="GetURL" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnClipboardCopyURL_Command" />
                                                                        <asp:HiddenField runat="server" ID="hidClipboardCopyURL" Value="" />
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
