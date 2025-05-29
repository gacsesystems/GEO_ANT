<%@ Page Title="Detalle de Encuesta" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DetalleEncuesta.aspx.vb" Inherits="GEO.DetalleEncuesta" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<%@ Import Namespace="GEO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" >
    <link href="../Content/SpecialRadioCheckBox.css" rel="stylesheet" />
    <link href="../Login/LoginMessage.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%----------------------------   SCRIPTS  -------------------------------------------------------------------------------%>
    <script type="text/javascript">
    </script>

    <asp:UpdatePanel ID="updpnlMainContent" runat="server" UpdateMode="Always" ChildrenAsTriggers="true" >
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
            <asp:Panel ID="pnlEditSeccion" runat="server" CssClass="modalCenter400fixed" Visible="False" DefaultButton="btnGuardarNombreSeccion">
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" VerticalAlign="Middle">
                            <asp:Label runat="server" ID="lblEditaSeccionTitle" Text="Editar sección" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnCloseEditSeccion" Text="&times;" CssClass="closebtn" />
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
                                        <asp:TextBox runat="server" ID="txtEditaNombreSeccion" TextMode="SingleLine" MaxLength="50" CssClass="PreguntaGetValues" ></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:Label runat="server" Text="Ubicar en la posición:" CssClass="PreguntaLabel"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="cboPosicionSeccion" DataTextField="DescNumeroSeccionProp" DataValueField="NumeroSeccionProp" CssClass="PreguntaGetValues"></asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell Width="100%" HorizontalAlign="Center" ColumnSpan="2">
                                        <asp:Panel ID="pnlMessageEditarSeccion" runat="server" CssClass="MessageScreenContainer" Visible="False">
                                            <asp:Label runat="server" ID="lblMessageEditaNombreSeccion" Text="" CssClass="MessageScreen"></asp:Label>
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
                                        <asp:Button runat="server" ID="btnGuardarNombreSeccion" Text="Guardar" CssClass="botonAction" />
                                    </asp:TableCell>
                                    <asp:TableCell Width="30%">&nbsp;</asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <asp:Panel ID="pnlDeleteSeccion" runat="server" CssClass="modalCenter400fixed" Visible="False" DefaultButton="btnDeleteSeccionDescartar">
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblDeleteSeccionTitle" Text="Eliminar sección" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnDeleteSeccionClose" Text="&times;" CssClass="closebtn" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblDeleteSeccionMessage" Text="" CssClass="WarningMessage"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                        <asp:TableCell Width="5%" HorizontalAlign="Center">
                            <asp:Button runat="server" ID="btnDeleteSeccionDescartar" Text="Cancelar" CssClass="botonAction" />
                        </asp:TableCell>
                        <asp:TableCell Width="5%" HorizontalAlign="Center">
                            <asp:Button runat="server" ID="btnDeleteSeccionConfirmar" Text="Continuar" CssClass="botonAction" />
                        </asp:TableCell>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <asp:Panel ID="pnlAddSeccion" runat="server" CssClass="modalCenter400fixed" Visible="False" DefaultButton="btnGuardarAddSeccion" >
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" VerticalAlign="Middle">
                            <asp:Label runat="server" ID="lblAddSeccionTitle" Text="Agregar sección" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnAddSeccionClose" Text="&times;" CssClass="closebtn" />
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
                                        <asp:TextBox runat="server" ID="txtAddNombreSeccion" TextMode="SingleLine" MaxLength="50" CssClass="PreguntaGetValues" ></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell Width="100%" HorizontalAlign="Center" ColumnSpan="2">
                                        <asp:Panel ID="pnlMessageAddSeccion" runat="server" CssClass="MessageScreenContainer" Visible="False">
                                            <asp:Label runat="server" ID="lblMessageAddNombreSeccion" Text="" CssClass="MessageScreen"></asp:Label>
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
                                        <asp:Button runat="server" ID="btnGuardarAddSeccion" Text="Guardar" CssClass="botonAction" />
                                    </asp:TableCell>
                                    <asp:TableCell Width="30%">&nbsp;</asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <asp:Panel ID="pnlDeletePregunta" runat="server" CssClass="modalCenter400fixed" Visible="False" DefaultButton="btnDeletePreguntaDescartar">
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblDeletePreguntaTitle" Text="Eliminar pregunta" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnDeletePreguntaClose" Text="&times;" CssClass="closebtn" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" VerticalAlign="Top" ColumnSpan="4">
                            <asp:Label runat="server" ID="lblDeletePreguntaMessage" Text="" CssClass="WarningMessage"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                        <asp:TableCell Width="5%" HorizontalAlign="Center">
                            <asp:Button runat="server" ID="btnDeletePreguntaDescartar" Text="Cancelar" CssClass="botonAction" />
                        </asp:TableCell>
                        <asp:TableCell Width="5%" HorizontalAlign="Center">
                            <asp:Button runat="server" ID="btnDeletePreguntaConfirmar" Text="Continuar" CssClass="botonAction" />
                        </asp:TableCell>
                        <asp:TableCell Width="5%">&nbsp;</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <asp:Panel ID="pnlAddPregunta" runat="server" CssClass="modalCenter600fixed" Visible="False" DefaultButton="btnGuardarAddPregunta" >
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="WarningTitleContent" VerticalAlign="Middle">
                            <asp:Label runat="server" ID="lblAddPreguntaTitle" Text="Agregar pregunta" CssClass="WarningTitle"></asp:Label>
                            <asp:Button runat="server" ID="btnAddPreguntaClose" Text="&times;" CssClass="closebtn" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center">
                            <asp:Table runat="server" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell>
                                         <asp:Table runat="server" Width="100%">
                                            <asp:TableRow CssClass="MenuSubTitle">
                                                <asp:TableCell Width="15%" HorizontalAlign="Center">
                                                    <asp:Label runat="server" Text="Sección:"></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell Width="85%" HorizontalAlign="Left">
                                                    <asp:Label runat="server" ID="lblIdSeccionAddPregunta" Text="" ></asp:Label>
                                                    <asp:Label runat="server" Text="&nbsp;-&nbsp;"></asp:Label>
                                                    <asp:Label runat="server" ID="lblNombreSeccionAddPregunta" Text="" ></asp:Label>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                             <asp:TableRow>
                                                 <asp:TableCell ColumnSpan="2">
                                                    <asp:Panel runat="server" ID="pnlSeccionDetailAddPregunta" CssClass="PreguntaContent">
                                                        <asp:Table runat="server" Width="100%" CssClass="NoBorder">
                                                            <asp:TableRow Width="100%">
                                                                <asp:TableCell HorizontalAlign="Left" ColumnSpan="2">
                                                                    <asp:Label runat="server" Text="Pregunta" CssClass="PreguntaTag"></asp:Label>
                                                                </asp:TableCell>
                                                            </asp:TableRow>
                                                            <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                                            <%-- Pregunta, Tipo de  Pregunta --%>
                                                            <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                                            <asp:TableRow>
                                                                <asp:TableCell Width="75%" CssClass="PreguntaContent" HorizontalAlign="Left">
                                                                    <asp:TextBox runat="server" ID="txtPreguntaAddPregunta" Text="" TextMode="SingleLine" CssClass="PreguntaValue" MaxLength="160"></asp:TextBox>
                                                                </asp:TableCell>
                                                                <asp:TableCell Width="25%" CssClass="PreguntaContent" >
                                                                    <asp:Table runat="server">
                                                                        <asp:TableRow>
                                                                            <asp:TableCell Width="10%" HorizontalAlign="Left">
                                                                                <asp:Label runat="server" Text="Tipo:&nbsp;" CssClass="PreguntaLabel"></asp:Label>
                                                                            </asp:TableCell>
                                                                            <asp:TableCell Width="10%" HorizontalAlign="Left">&nbsp;
                                                                            </asp:TableCell>
                                                                            <asp:TableCell Width="80%">
                                                                                <asp:DropDownList runat="server" ID="cboTipoPreguntaAddPregunta" CssClass="PreguntaLabel showColorBackGray NoBorder" Width="100%" AutoPostBack="true">
                                                                                    <asp:ListItem Value="1" Text="&nbsp;Valoración" Selected="True" ></asp:ListItem>
                                                                                    <asp:ListItem Value="2" Text="&nbsp;Valor numérico" ></asp:ListItem>
                                                                                    <asp:ListItem Value="3" Text="&nbsp;Texto corto" ></asp:ListItem>
                                                                                    <asp:ListItem Value="4" Text="&nbsp;Texto largo" ></asp:ListItem>
                                                                                    <asp:ListItem Value="5" Text="&nbsp;Opción múltiple" ></asp:ListItem>
                                                                                    <asp:ListItem Value="6" Text="&nbsp;Selección múltiple" ></asp:ListItem>
                                                                                    <asp:ListItem Value="7" Text="&nbsp;Lista desplegable" ></asp:ListItem>
                                                                                    <asp:ListItem Value="8" Text="&nbsp;Fecha" ></asp:ListItem>
                                                                                    <asp:ListItem Value="9" Text="&nbsp;Hora" ></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </asp:TableCell>
                                                                        </asp:TableRow>
                                                                    </asp:Table>
                                                                </asp:TableCell>
                                                            </asp:TableRow>
                                                            <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                                            <%-- Precedencia, Obligatoria, Condicion, acciones --%>
                                                            <%--        Valores de las preguntas --%>
                                                            <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                                            <asp:TableRow>
                                                                <%-- Precedencia, Obligatoria, Condicion --%>
                                                                <asp:TableCell CssClass="AnswerDesignContent" HorizontalAlign="Center">
                                                                    <asp:Panel runat="server">
                                                                        <asp:Table runat="server" Width="100%">
                                                                            <asp:TableRow>
                                                                                <asp:TableCell Width="33%">
                                                                                    <asp:Label runat="server" Text="Precedencia" CssClass="PreguntaGetValuesLabel" ></asp:Label>
                                                                                    <br />
                                                                                    <asp:DropDownList runat="server" ID="cboPredecenciaAddPregunta" DataTextField="PrecedenciaProp" DataValueField="PrecedenciaProp" CssClass="PreguntaGetValues"></asp:DropDownList>
                                                                                </asp:TableCell>
                                                                                <asp:TableCell Width="33%">
                                                                                    <asp:Label runat="server" Text="Pregunta padre" CssClass="PreguntaGetValuesLabel" ></asp:Label>
                                                                                    <br />
                                                                                    <asp:DropDownList runat="server" ID="cboPreguntaPadreAddPregunta" DataTextField="PrecedenciaProp" DataValueField="idPreguntaProp" CssClass="PreguntaGetValues"></asp:DropDownList>
                                                                                </asp:TableCell>
                                                                                <asp:TableCell Width="34%">
                                                                                    <asp:CheckBox runat="server" ID="chkPreguntaRequeridaAddPregunta" Checked="false" CssClass="PreguntaGetValues" Text="Pregunta requerida" />
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                            <asp:TableRow>
                                                                                <asp:TableCell ColumnSpan="3">
                                                                                    <asp:Label runat="server" Text="Mostrar si la respuesta del padre es" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                    <asp:TextBox runat="server" ID="txtCondicionPresentacionAddPregunta" Text="" TextMode="SingleLine" MaxLength="50" CssClass="PreguntaGetValues text100"></asp:TextBox>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                        </asp:Table>
                                                                    </asp:Panel>
                                                                </asp:TableCell>
                                                                <%-- ///////////////////////// Valores /////////////////////////////////////////////////////////--%>
                                                                <asp:TableCell CssClass="PreguntaContent" HorizontalAlign="Left">
                                                                    <%----------------------------  Valores numericos -----------------------------------------------------------%>
                                                                    <asp:Panel runat="server" ID="pnlValoresNumericosAddPregunta" Visible="false">
                                                                        <asp:Table runat="server">
                                                                            <asp:TableRow>
                                                                                <asp:TableCell Width="60%" >
                                                                                    <asp:Label runat="server" Text="Valor inicial:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                </asp:TableCell>
                                                                                <asp:TableCell Width="40%">
                                                                                    <asp:TextBox runat="server" ID="txtValoresNumericosInicialAddPregunta" TextMode="Number" CssClass="PreguntaGetValues"></asp:TextBox>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                            <asp:TableRow>
                                                                                <asp:TableCell Width="60%">
                                                                                    <asp:Label runat="server" Text="Valor final:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                </asp:TableCell>
                                                                                <asp:TableCell Width="40%">
                                                                                    <asp:TextBox runat="server" ID="txtValoresNumericosFinalAddPregunta" TextMode="Number" CssClass="PreguntaGetValues"></asp:TextBox>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                        </asp:Table>
                                                                    </asp:Panel>

                                                                    <%----------------------------  Valores opcion multiple -------------------------------------------------%>
                                                                    <asp:Panel runat="server" ID="pnlValoresOpcionMultipleAddPregunta" Visible="false">
                                                                        <asp:Table runat="server" Width="100%">
                                                                            <asp:TableRow>
                                                                                <asp:TableCell HorizontalAlign="Center" CssClass="showColorBackGray">
                                                                                    <asp:Label runat="server" Text="Valores" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>
                                                                                    <asp:Table runat="server">
                                                                                        <asp:TableRow>
                                                                                            <asp:TableCell>
                                                                                                <asp:Label runat="server" Text="Valor nuevo:" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                                <asp:TextBox runat="server" ID="txtAddOpcionMultipleAddPregunta" Text="" MaxLength="50" TextMode="SingleLine" CssClass="PreguntaGetValues"></asp:TextBox>
                                                                                            </asp:TableCell>
                                                                                            <asp:TableCell>
                                                                                                <asp:Button runat="server" ID="btnAddOpcionMultipleAddPregunta" Text="Agregar" CssClass="miniBotonAction cursorAdd" CommandName="AddOpcionMultiple" OnCommand="btnModifyListAddPregunta_Command" />
                                                                                            </asp:TableCell>
                                                                                        </asp:TableRow>
                                                                                        <asp:TableRow>
                                                                                            <asp:TableCell ColumnSpan="2">
                                                                                                <asp:ListBox runat="server" ID="lstbxValoresOpcionMultipleAddPregunta" CssClass="PreguntaGetValues" Width="100%"></asp:ListBox>
                                                                                            </asp:TableCell>
                                                                                        </asp:TableRow>
                                                                                        <asp:TableRow>
                                                                                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                                                                                <asp:Button runat="server" ID="btnDeleteOpcionMultipleAddPregunta" Text="Borrar seleccionado" CssClass="miniBotonAction" CommandName="DeleteOpcionMultiple" OnCommand="btnModifyListAddPregunta_Command" />
                                                                                            </asp:TableCell>
                                                                                        </asp:TableRow>
                                                                                    </asp:Table>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                        </asp:Table>
                                                                    </asp:Panel>

                                                                    <%----------------------------  Valores seleccion multiple ----------------------------------------------%>
                                                                    <asp:Panel runat="server" ID="pnlValoresSeleccionMultipleAddPregunta" Visible="false">
                                                                        <asp:Table runat="server" Width="100%">
                                                                            <asp:TableRow>
                                                                                <asp:TableCell HorizontalAlign="Center" CssClass="showColorBackGray">
                                                                                    <asp:Label runat="server" Text="Valores&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>
                                                                                    <asp:Table runat="server">
                                                                                        <asp:TableRow>
                                                                                            <asp:TableCell>
                                                                                                <asp:Label runat="server" Text="Valor nuevo:" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                                <asp:TextBox runat="server" ID="txtAddSeleccionMultipleAddPregunta" Text="" MaxLength="50" TextMode="SingleLine" CssClass="PreguntaGetValues"></asp:TextBox>
                                                                                            </asp:TableCell>
                                                                                            <asp:TableCell>
                                                                                                <asp:Button runat="server" ID="btnAddSeleccionMultipleAddPregunta" Text="Agregar" CssClass="miniBotonAction cursorAdd" CommandName="AddSeleccionMultiple" OnCommand="btnModifyListAddPregunta_Command" />
                                                                                            </asp:TableCell>
                                                                                        </asp:TableRow>
                                                                                        <asp:TableRow>
                                                                                            <asp:TableCell ColumnSpan="2">
                                                                                                <asp:ListBox runat="server" ID="lstbxValoresSeleccionMultipleAddPregunta" CssClass="PreguntaGetValues" Width="100%"></asp:ListBox>
                                                                                            </asp:TableCell>
                                                                                        </asp:TableRow>
                                                                                        <asp:TableRow>
                                                                                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                                                                                <asp:Button runat="server" ID="btnDeleteSeleccionMultipleAddPregunta" Text="Borrar seleccionado" CssClass="miniBotonAction" CommandName="DeleteSeleccionMultiple" OnCommand="btnModifyListAddPregunta_Command" />
                                                                                            </asp:TableCell>
                                                                                        </asp:TableRow>
                                                                                    </asp:Table>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                        </asp:Table>
                                                                    </asp:Panel>

                                                                    <%----------------------------  Valores lista desplegable -----------------------------------------------%>
                                                                    <asp:Panel runat="server" ID="pnlValoresListaDesplegableAddPregunta" Visible="false">
                                                                        <asp:Table runat="server" Width="100%">
                                                                            <asp:TableRow>
                                                                                <asp:TableCell HorizontalAlign="Center" CssClass="showColorBackGray">
                                                                                    <asp:Label runat="server" Text="Valores" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                            <asp:TableRow>
                                                                                <asp:TableCell>
                                                                                    <asp:Table runat="server">
                                                                                        <asp:TableRow>
                                                                                            <asp:TableCell>
                                                                                                <asp:Label runat="server" Text="Valor nuevo:" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                                <asp:TextBox runat="server" ID="txtAddListaDesplegableAddPregunta" Text="" MaxLength="50" TextMode="SingleLine" CssClass="PreguntaGetValues"></asp:TextBox>
                                                                                            </asp:TableCell>
                                                                                            <asp:TableCell>
                                                                                                <asp:Button runat="server" ID="btnAddListaDesplegableAddPregunta" Text="Agregar" CssClass="miniBotonAction cursorAdd" CommandName="AddListaDesplegable" OnCommand="btnModifyListAddPregunta_Command" />
                                                                                            </asp:TableCell>
                                                                                        </asp:TableRow>
                                                                                        <asp:TableRow>
                                                                                            <asp:TableCell ColumnSpan="2">
                                                                                                <asp:ListBox runat="server" ID="lstbxValoresListaDesplegableAddPregunta" CssClass="PreguntaGetValues" Width="100%"></asp:ListBox>
                                                                                            </asp:TableCell>
                                                                                        </asp:TableRow>
                                                                                        <asp:TableRow>
                                                                                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                                                                                <asp:Button runat="server" ID="btnDeleteListaDesplegableAddPregunta" Text="Borrar seleccionado" CssClass="miniBotonAction" CommandName="DeleteListaDesplegable" OnCommand="btnModifyListAddPregunta_Command" />
                                                                                            </asp:TableCell>
                                                                                        </asp:TableRow>
                                                                                    </asp:Table>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                        </asp:Table>
                                                                    </asp:Panel>

                                                                    <%----------------------------  Valores fecha -----------------------------------------------------------%>
                                                                    <asp:Panel runat="server" ID="pnlValoresFechaAddPregunta" Visible="false">
                                                                        <asp:Table runat="server">
                                                                            <asp:TableRow>
                                                                                <asp:TableCell Width="60%" >
                                                                                    <asp:Label runat="server" Text="Desde:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                </asp:TableCell>
                                                                                <asp:TableCell Width="40%">
                                                                                    <asp:TextBox runat="server" ID="txtValoresFechaDesdeAddPregunta" TextMode="Date" CssClass="PreguntaGetValues"></asp:TextBox>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                            <asp:TableRow>
                                                                                <asp:TableCell Width="60%">
                                                                                    <asp:Label runat="server" Text="Hasta:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                </asp:TableCell>
                                                                                <asp:TableCell Width="40%">
                                                                                    <asp:TextBox runat="server" ID="txtValoresFechaHastaAddPregunta" TextMode="Date" CssClass="PreguntaGetValues"></asp:TextBox>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                        </asp:Table>
                                                                    </asp:Panel>

                                                                    <%----------------------------  Valores hora -----------------------------------------------------------%>
                                                                    <asp:Panel runat="server" ID="pnlValoresHoraAddPregunta" Visible="false">
                                                                        <asp:Table runat="server">
                                                                            <asp:TableRow>
                                                                                <asp:TableCell Width="60%" >
                                                                                    <asp:Label runat="server" Text="Desde:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                </asp:TableCell>
                                                                                <asp:TableCell Width="40%">
                                                                                    <asp:TextBox runat="server" ID="txtValoresHoraDesdeAddPregunta" TextMode="Time" CssClass="PreguntaGetValues"></asp:TextBox>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                            <asp:TableRow>
                                                                                <asp:TableCell Width="60%">
                                                                                    <asp:Label runat="server" Text="Hasta:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                                </asp:TableCell>
                                                                                <asp:TableCell Width="40%">
                                                                                    <asp:TextBox runat="server" ID="txtValoresHoraHastaAddPregunta" TextMode="Time" CssClass="PreguntaGetValues"></asp:TextBox>
                                                                                </asp:TableCell>
                                                                            </asp:TableRow>
                                                                        </asp:Table>
                                                                    </asp:Panel>
                                                                </asp:TableCell>
                                                            </asp:TableRow>
                                                        </asp:Table>
                                                    </asp:Panel>
                                                 </asp:TableCell>
                                             </asp:TableRow>
                                      </asp:Table>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell Width="100%" HorizontalAlign="Center" >
                                        <asp:Panel ID="pnlMessageAddPregunta" runat="server" CssClass="MessageScreenContainer" Visible="False">
                                            <asp:Label runat="server" ID="lblMessageAddPregunta" Text="" CssClass="MessageScreen"></asp:Label>
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
                                        <asp:Button runat="server" ID="btnGuardarAddPregunta" Text="Guardar" CssClass="botonAction" />
                                    </asp:TableCell>
                                    <asp:TableCell Width="30%">&nbsp;</asp:TableCell>
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
            <asp:Panel runat="server" CssClass="VerticalSpace GridStyleContainer NoBorder" HorizontalAlign="Center">
                <asp:Panel runat="server" DefaultButton="btnGuardarEncuesta">
                    <asp:Table runat="server">
                        <asp:TableRow>
                            <asp:TableCell Width="90%" CssClass="BorderLightGray">
                                <asp:Table runat="server" CssClass="NoBorder" Width="100%" >
                                    <asp:TableRow>
                                        <asp:TableCell Width="100%">
                                            <asp:TextBox runat="server" Text="" ID="txtNombreEncuesta" TextMode="SingleLine" CssClass="DataFieldText text100" MaxLength="50"></asp:TextBox>
                                            <asp:HiddenField runat="server" ID="hidNombreEncuesta" Value="" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell HorizontalAlign="Left">
                                            <asp:Label runat="server" ID="lblNombreEncuesta" Text="Nombre de la encuesta" CssClass="DataFieldLabel"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                            <asp:TableCell>&nbsp;</asp:TableCell>
                            <asp:TableCell Width="10%" CssClass="BorderLightGray" VerticalAlign="Top">
                                <asp:Table runat="server" CssClass="NoBorder" Width="100%" >
                                    <asp:TableRow>
                                        <asp:TableCell Width="100%">
                                            <asp:TextBox runat="server" Text="" ID="txtFechaRegistro" TextMode="SingleLine" CssClass="DataFieldTextDisabled" MaxLength="50" Enabled="false"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell HorizontalAlign="Left" CssClass="DataFieldLabel">
                                            <asp:Label runat="server" ID="lblFechaRegistroL" Text="Fecha de registro" ></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell Width="90%">
                                <asp:Table runat="server" Width="100%">
                                    <asp:TableRow>
                                        <asp:TableCell Width="89%">&nbsp;</asp:TableCell>
                                        <asp:TableCell Width="5%">
                                            <asp:Button runat="server" ID="btnCancelarCambiosEncuesta" Text="Cancelar" CssClass="botonAction"/>
                                        </asp:TableCell>
                                        <asp:TableCell Width="1%">&nbsp;</asp:TableCell>
                                        <asp:TableCell Width="5%">
                                            <asp:Button runat="server" ID="btnGuardarEncuesta" Text="Guardar" CssClass="botonAction" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                            <asp:TableCell>&nbsp;</asp:TableCell>
                            <asp:TableCell Width="10%">&nbsp;</asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>

                </asp:Panel>

                <asp:HiddenField runat="server" ID="hidIdPregunta" Value="0" />
                <asp:HiddenField runat="server" ID="hidIdSeccion" Value="0" />

                <asp:GridView ID="grdPreguntas" runat="server" AutoGenerateColumns="False" DataKeyNames="idPreguntaProp,idSeccionProp" EnablePersistedSelection="True" AllowPaging="False" ShowHeaderWhenEmpty="true" ShowHeader="true" ShowFooter="true" EmptyDataText="&nbsp;No hay preguntas para esta encuesta&nbsp;" CssClass="NoBorder VerticalSpace" EmptyDataRowStyle-CssClass="NoBorder GridEmptyDataRowStyle" GridLines="None" Width="100%">
                    <Columns>
                        <%--<asp:DynamicField DataField="NombreSeccionProp" ValidationGroup="false" />--%>
                        <asp:TemplateField>

                            <HeaderTemplate>

                                <asp:Button runat="server" ID="btnAddSeccion" Text="+ Agregar sección" CssClass="ButtonCompleteWide" OnClick="btnAddSeccion_Click" />
                                <asp:Panel runat="server" ID="pnlAddSeccionFooter" CssClass="SeccionPreguntasContent NoBorder" HorizontalAlign="Left">
                                </asp:Panel>

                            </HeaderTemplate>

                            <%-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --%>
                            <%-- ////////////////////// Item Templeate  ////////////////////////////////////////////////////////////////////////////// --%>
                            <%-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --%>
                            <ItemTemplate>

                                <%----------------------------   Footer Seccion --------------------------------------------------------------------------%>
                                <asp:Panel runat="server" ID="pnlSeccionFooter" CssClass="SeccionPreguntasContentFooter NoBorder" Width="100%" >
                                    <asp:Table runat="server" Width="100%" CssClass="NoBorder">
                                        <asp:TableRow>
                                            <asp:TableCell Width="100%" HorizontalAlign="Right">
                                                <asp:ImageButton runat="server" ID="btnAddQuestion" ImageUrl="~/Images/Add48.png" ToolTip="Agregar pregunta" CommandName="AddQuestion" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnAddQuestion_Command" />
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:Panel>

                                <%----------------------------   Header Seccion --------------------------------------------------------------------------%>
                                <asp:Panel runat="server" ID="pnlSeccionHeader" CssClass="SeccionPreguntasContent NoBorder" >
                                    <asp:Table runat="server" Width="100%" CssClass="NoBorder">
                                        <asp:TableRow Width="100%">
                                            <asp:TableCell Width="10%">&nbsp;</asp:TableCell>
                                            <asp:TableCell Width="90%">&nbsp;</asp:TableCell>
                                            <asp:TableCell HorizontalAlign="Right">
                                                <asp:Menu runat="server" ID="mnuEditarSeccion" DisappearAfter="500" Orientation="Horizontal" OnMenuItemClick="mnuEditarSeccion_Click" DataSourceID="" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" DynamicHorizontalOffset="24" DynamicVerticalOffset="4" StaticEnableDefaultPopOutImage="false" StaticMenuStyle-CssClass="SeccionPreguntasTag" StaticHoverStyle-CssClass="SeccionPreguntasTag">
                                                    <Items>
                                                        <asp:MenuItem Text="&nbsp;Sección" ImageUrl="~/Images/menu_16w.png">
                                                            <asp:MenuItem Value="1" Text="" ToolTip="Editar sección" ImageUrl="~/Images/Edit48w.png" ></asp:MenuItem>
                                                            <asp:MenuItem Value="2" Text="" ToolTip="Borrar sección" ImageUrl="~/Images/Delete48w.png"></asp:MenuItem>
                                                        </asp:MenuItem>
                                                    </Items>
                                                </asp:Menu>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow CssClass="SeccionPreguntasName">
                                            <asp:TableCell Width="10%" HorizontalAlign="Center">
                                                <asp:Label runat="server" ID="lblIdSeccion" Text='<%# Eval("NumeroSeccionProp") %>' ></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell Width="90%" HorizontalAlign="Left" ColumnSpan="2">
                                                <asp:Label runat="server" ID="lblNombreSeccion" Text='<%# Eval("NombreSeccionProp") %>' ></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:Panel>

                                <%----------------------------   Detail Seccion --------------------------------------------------------------------------%>
                                <asp:Panel runat="server" ID="pnlSeccionDetail" CssClass="PreguntaContent">
                                    <asp:Table runat="server" Width="100%" CssClass="NoBorder">
                                        <asp:TableRow Width="100%">
                                            <asp:TableCell HorizontalAlign="Right" ColumnSpan="3">
                                                <asp:Label runat="server" Text="Pregunta" CssClass="PreguntaTag"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <%-- Consecutivo, Pregunta, Tipo de  Pregunta --%>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <asp:TableRow>
                                            <asp:TableCell Width="5%" HorizontalAlign="Center" >
                                                <asp:Label runat="server" ID="lblConsecutivoPregunta" Text='<%# Eval("PrecedenciaProp") %>' CssClass="PreguntaConsecutive"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell Width="75%" CssClass="PreguntaContent" HorizontalAlign="Left">
                                                <asp:Label runat="server" Text='<%# Eval("PreguntaProp") %>' CssClass="CellDataValue"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell Width="20%" CssClass="PreguntaContent" >
                                                <asp:Table runat="server">
                                                    <asp:TableRow>
                                                        <asp:TableCell Width="10%" HorizontalAlign="Left">
                                                            <asp:Label runat="server" Text="Tipo:&nbsp;" CssClass="PreguntaLabel"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell Width="10%" HorizontalAlign="Left">&nbsp;
<%--                                                            <asp:Menu runat="server" ID="mnuTipoPregunta" DisappearAfter="500" Orientation="Horizontal" >
                                                                    <Items>                                                                    
                                                                        <asp:MenuItem Text="≡" >                                                                    
                                                                            <asp:MenuItem Value="1" Text="&nbsp;Valoración" ImageUrl="~/Images/filled_star_32.png"></asp:MenuItem>
                                                                            <asp:MenuItem Value="2" Text="&nbsp;Valor numérico" ImageUrl="~/Images/numbers_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="3" Text="&nbsp;Texto corto" ImageUrl="~/Images/textbox_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="4" Text="&nbsp;Texto largo" ImageUrl="~/Images/textbox_multi_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="5" Text="&nbsp;Opción múltiple" ImageUrl="~/Images/select_list_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="6" Text="&nbsp;Selección múltiple" ImageUrl="~/Images/checklist_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="7" Text="&nbsp;Lista desplegable" ImageUrl="~/Images/dropdown_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="8" Text="&nbsp;Fecha" ImageUrl="~/Images/calendar_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="9" Text="&nbsp;Hora" ImageUrl="~/Images/time_32.png" ></asp:MenuItem>
                                                                        </asp:MenuItem>
                                                                    </Items>
                                                                    <StaticMenuItemStyle CssClass="TipoPreguntaMenuItem" />
                                                                    <DynamicHoverStyle BackColor="#d62159" ForeColor="White" />
                                                                    <DynamicMenuItemStyle CssClass="TipoPreguntaSubMenuItem" />
                                                                </asp:Menu>--%>
                                                        </asp:TableCell>
                                                        <asp:TableCell Width="80%" HorizontalAlign="Left">&nbsp;
                                                            <asp:Label runat="server" ID="lblDescTipoPregunta" Text='<%# Eval("DescTipoPreguntaProp") %>' CssClass="CellDataValue"></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <%-- Ejemplo de respuesta de acuerdo al tipo de pregunta --%>
                                        <%--        Valores de las preguntas --%>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <asp:TableRow>
                                            <%-- ///////////////////////// Ejemplos ////////////////////////////////////////////////////////--%>
                                            <asp:TableCell ColumnSpan="2" CssClass="AnswerDesignContent" HorizontalAlign="Center">
                                                <%----------------------------  Valoración ---------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoracion" Visible="false">
                                                    <asp:Image runat="server" ImageUrl="~/Images/filled_star_32.png" />
                                                    <asp:Image runat="server" ImageUrl="~/Images/filled_star_32.png" />
                                                    <asp:Image runat="server" ImageUrl="~/Images/filled_star_32.png" />
                                                    <asp:Image runat="server" ImageUrl="~/Images/empty_star_32.png" />
                                                    <asp:Image runat="server" ImageUrl="~/Images/empty_star_32.png" />

<%--                                                    <asp:Panel runat="server" CssClass="star-rating">
                                                        <asp:HyperLink runat="server" NavigateUrl="#">&nbsp;</asp:HyperLink>
                                                        <asp:HyperLink runat="server" NavigateUrl="#">&nbsp;</asp:HyperLink>
                                                        <asp:HyperLink runat="server" NavigateUrl="#">&nbsp;</asp:HyperLink>
                                                        <asp:HyperLink runat="server" NavigateUrl="#">&nbsp;</asp:HyperLink>
                                                        <asp:HyperLink runat="server" NavigateUrl="#">&nbsp;</asp:HyperLink>
                                                    </asp:Panel>--%>

                                                </asp:Panel>
                                                <%----------------------------  Valor numérico -----------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValorNumerico" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorNumerico" Text="12345" TextMode="Number" ReadOnly="true" CssClass="PreguntaLabel" ></asp:TextBox>
                                                </asp:Panel>
                                                <%----------------------------  Texto corto --------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlTextoCorto" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorTextoCorto" Text="Lorem ipsum dolor sit amet, consectetur cras amet..." TextMode="SingleLine" ReadOnly="true" CssClass="PreguntaLabel" Width="99%" MaxLength="1000"></asp:TextBox>
                                                </asp:Panel>
                                                <%----------------------------  Texto largo --------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlTextoLargo" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorTextoLargo" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam lacus odio, congue sed tincidunt non, aliquam ut ex. Morbi sit amet ante non leo venenatis maximus commodo et odio. Nulla a massa nunc..." TextMode="MultiLine" ReadOnly="true" Rows="2"  CssClass="PreguntaLabel textarea100" resize="none"></asp:TextBox>
                                                </asp:Panel>
                                                <%----------------------------  Opción múltiple ---------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlOpcionMultiple" Visible="false">
                                                    <asp:RadioButtonList runat="server" ID="rdlstValorOpcionMultiple" RepeatColumns="5" CssClass="PreguntaLabel" >
                                                        <asp:ListItem Text="Opción 1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Opción 2"></asp:ListItem>
                                                        <asp:ListItem Text="Opción 3"></asp:ListItem>
                                                        <asp:ListItem Text="Opción 4"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <label for="" class=""></label>
                                                </asp:Panel>
                                                <%----------------------------  Selección múltiple -------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlSeleccionMultiple" Visible="false">
                                                    <asp:CheckBoxList runat="server" ID="chlstValorSeleccionMultiple" RepeatColumns="5" CssClass="PreguntaLabel">
                                                        <asp:ListItem Text="Opción 1"></asp:ListItem>
                                                        <asp:ListItem Text="Opción 2"></asp:ListItem>
                                                    </asp:CheckBoxList>
                                                </asp:Panel>
                                                <%----------------------------  Lista desplegable --------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlListaDesplegable" Visible="false">
                                                    <asp:DropDownList runat="server" ID="ddlstValorListaDesplegable" CssClass="PreguntaLabel large">
                                                        <asp:ListItem Text="Opción 1" class="good"></asp:ListItem>
                                                        <asp:ListItem Text="Opción 2" class="bad"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </asp:Panel>
                                                <%----------------------------  Fecha --------------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlFecha" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorFecha" Text="2020-01-01" TextMode="Date" ReadOnly="true" CssClass="PreguntaLabel"></asp:TextBox>
                                                </asp:Panel>
                                                <%----------------------------  Hora ---------------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlHora" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorHora" Text="12:00" TextMode="Time" ReadOnly="true" CssClass="PreguntaLabel"></asp:TextBox>
                                                </asp:Panel>
                                            </asp:TableCell>
                                            <%-- ///////////////////////// Valores /////////////////////////////////////////////////////////--%>
                                            <asp:TableCell CssClass="PreguntaContent" HorizontalAlign="Left">
                                                <%----------------------------  Valores numericos -----------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoresNumericos" Visible="false">
                                                    <asp:Table runat="server">
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="60%" >
                                                                <asp:Label runat="server" Text="Valor inicial:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%">
                                                                <asp:Label runat="server" ID="lblValoresNumericosInicial" Text='<%# Eval("NumeroMinimoProp") %>' CssClass="CellDataValue"></asp:Label>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="60%">
                                                                <asp:Label runat="server" Text="Valor final:&nbsp;"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%">
                                                                <asp:Label runat="server" ID="lblValoresNumericosFinal" Text='<%# Eval("NumeroMaximoProp") %>' CssClass="CellDataValue"></asp:Label>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>

                                                <%----------------------------  Valores opcion multiple -------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoresOpcionMultiple" Visible="false">
                                                    <asp:Table runat="server" Width="100%">
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                                <asp:Label runat="server" Text="Valores:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                                <asp:ListBox runat="server" ID="lstbxValoresOpcionMultiple" CssClass="PreguntaGetValues" Width="100%"></asp:ListBox>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>

                                                <%----------------------------  Valores seleccion multiple ----------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoresSeleccionMultiple" Visible="false">
                                                    <asp:Table runat="server" Width="100%">
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                                <asp:Label runat="server" Text="Valores:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                                <asp:ListBox runat="server" ID="lstbxValoresSeleccionMultiple" CssClass="PreguntaGetValues" Width="100%"></asp:ListBox>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>

                                                <%----------------------------  Valores lista desplegable -----------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoresListaDesplegable" Visible="false">
                                                    <asp:Table runat="server" Width="100%">
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                                <asp:Label runat="server" Text="Valores:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                                <asp:ListBox runat="server" ID="lstbxValoresListaDesplegable" CssClass="PreguntaGetValues" Width="100%"></asp:ListBox>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>

                                                <%----------------------------  Valores fecha -----------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoresFecha" Visible="false">
                                                    <asp:Table runat="server">
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="60%" >
                                                                <asp:Label runat="server" Text="Desde:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%">
                                                                <asp:Label runat="server" ID="lblValoresFechaDesde" Text='<%# Eval("FechaHoraDesdeProp", "{0:dd/MM/yyyy}") %>' CssClass="CellDataValue"></asp:Label>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="60%">
                                                                <asp:Label runat="server" Text="Hasta:&nbsp;"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%">
                                                                <asp:Label runat="server" ID="lblValoresFechaHasta" Text='<%# Eval("FechaHoraHastaProp", "{0:dd/MM/yyyy}") %>' CssClass="CellDataValue"></asp:Label>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>

                                                <%----------------------------  Valores hora -----------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoresHora" Visible="false">
                                                    <asp:Table runat="server">
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="60%" >
                                                                <asp:Label runat="server" Text="Desde:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%">
                                                                <asp:Label runat="server" ID="lblValoresHoraDesde" Text='<%# Eval("FechaHoraDesdeProp", "{0:HH:mm}") %>' CssClass="CellDataValue"></asp:Label>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="60%">
                                                                <asp:Label runat="server" Text="Hasta:&nbsp;"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%">
                                                                <asp:Label runat="server" ID="lblValoresHoraHasta" Text='<%# Eval("FechaHoraHastaProp", "{0:HH:mm}") %>' CssClass="CellDataValue"></asp:Label>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <%-- Precedencia, Obligatoria, Condicion, acciones --%>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <asp:TableRow>
                                            <asp:TableCell ColumnSpan="3" CssClass="AnswerDesignContent">
                                                <asp:Panel runat="server">
                                                    <asp:Table runat="server" Width="100%">
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="10%" HorizontalAlign="Center">
                                                                <asp:Label runat="server" Text="Precedencia" CssClass="PreguntaGetValuesLabel" ></asp:Label>
                                                                <br />
                                                                <asp:Label runat="server" Text='<%# Eval("PrecedenciaProp") %>' CssClass="CellDataValue"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="10%" HorizontalAlign="Center">
                                                                <asp:Label runat="server" Text="Pregunta&nbsp;padre" CssClass="PreguntaGetValuesLabel" ></asp:Label>
                                                                <br />
                                                                <asp:Label runat="server" Text='<%# Eval("ConsecutivoPadreProp") %>' CssClass="CellDataValue"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="20%">
                                                                <asp:CheckBox runat="server" ID="chkPreguntaRequerida" Checked='<%# Eval("ObligatoriaProp") %>' Text="Pregunta requerida" Enabled="false" />
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%" HorizontalAlign="Center">
                                                                <asp:Label runat="server" Text="Mostrar si la respuesta del padre es" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                <br />
                                                                <asp:Label runat="server" Text="&nbsp;" CssClass="CellDataValue showColorBackGray" Width="100%"><%# Eval("ValorCondicionProp") %></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="5%" HorizontalAlign="Center">&nbsp;</asp:TableCell>
                                                            <asp:TableCell Width="5%" HorizontalAlign="Center">
                                                                <asp:ImageButton runat="server" ID="btnDuplicarPregunta" ImageUrl="~/Images/Copy_32.png" ToolTip="Duplicar pregunta" CommandName="EditaPregunta" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnClick="btnDuplicarPregunta_Click" />
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="5%" HorizontalAlign="Center">
                                                                <asp:ImageButton runat="server" ID="btnEliminarPregunta" ImageUrl="~/Images/Delete32b.png" ToolTip="Borrar pregunta" CommandName="EditaPregunta" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnClick="btnEliminarPregunta_Click"/>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="5%" HorizontalAlign="Center">
                                                                <asp:ImageButton runat="server" ID="btnEditarPregunta" ImageUrl="~/Images/Edit_32b.png" ToolTip="Editar pregunta" CommandName="EditaPregunta" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnClick="btnEditarPregunta_Click"/> <%--OnClientClick="javascript:__doPostBack('ctl00$MainContent$grdPreguntas','Edit$0');return false;" --%>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:Panel>

                            </ItemTemplate>

                            <%-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --%>
                            <%-- ////////////////////// Edit Templeate  ////////////////////////////////////////////////////////////////////////////// --%>
                            <%-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --%>

                            <EditItemTemplate>

                                <%----------------------------   Header Seccion --------------------------------------------------------------------------%>
                                <asp:Panel runat="server" ID="pnlSeccionHeader" CssClass="SeccionPreguntasContent NoBorder" >
                                    <asp:Table runat="server" Width="100%" CssClass="NoBorder">
                                        <asp:TableRow Width="100%">
                                            <asp:TableCell Width="10%">&nbsp;</asp:TableCell>
                                            <asp:TableCell Width="90%">&nbsp;</asp:TableCell>
                                            <asp:TableCell HorizontalAlign="Right">
                                                <asp:Label runat="server" Text="Sección" CssClass="SeccionPreguntasTag"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow CssClass="SeccionPreguntasName">
                                            <asp:TableCell Width="10%" HorizontalAlign="Center">
                                                <asp:Label runat="server" ID="lblIdSeccion" Text='<%# Eval("NumeroSeccionProp") %>' ></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell Width="90%" HorizontalAlign="Left" ColumnSpan="2">
                                                <asp:Label runat="server" ID="lblNombreSeccion" Text='<%# Eval("NombreSeccionProp") %>' ></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:Panel>

                                <%----------------------------   Detail Seccion --------------------------------------------------------------------------%>
                                <asp:Panel runat="server" ID="pnlSeccionDetail" CssClass="PreguntaContent">
                                    <asp:Table runat="server" Width="100%" CssClass="NoBorder">
                                        <asp:TableRow Width="100%">
                                            <asp:TableCell HorizontalAlign="Right" ColumnSpan="3">
                                                <asp:Label runat="server" Text="Pregunta" CssClass="PreguntaTag"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <%-- Consecutivo, Pregunta, Tipo de  Pregunta --%>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <asp:TableRow>
                                            <asp:TableCell Width="5%" HorizontalAlign="Center" >
                                                <asp:Label runat="server" ID="lblConsecutivoPregunta" Text='<%# Eval("PrecedenciaProp") %>' CssClass="PreguntaConsecutive"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell Width="75%" CssClass="PreguntaContent" HorizontalAlign="Left">
                                                <asp:TextBox runat="server" ID="txtPregunta" Text='<%# Eval("PreguntaProp") %>' TextMode="SingleLine" CssClass="PreguntaValue" MaxLength="160"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell Width="20%" CssClass="PreguntaContent" >
                                                <asp:Table runat="server">
                                                    <asp:TableRow>
                                                        <asp:TableCell Width="10%" HorizontalAlign="Left">
                                                            <asp:Label runat="server" Text="Tipo:&nbsp;" CssClass="PreguntaLabel"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell Width="10%" HorizontalAlign="Left">&nbsp;
<%--                                                            <asp:Panel runat="server" Width="100%">
                                                                <asp:Menu runat="server" ID="mnuTipoPregunta" DisappearAfter="500" Orientation="Horizontal" StaticEnableDefaultPopOutImage="false" DynamicHorizontalOffset="-80" DynamicVerticalOffset="0"  Width="100%">
                                                                    <Items>                                                                    
                                                                        <asp:MenuItem Text="≡&nbsp;" >
                                                                            <asp:MenuItem Value="1" Text="&nbsp;Valoración" ImageUrl="~/Images/filled_star_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="2" Text="&nbsp;Valor numérico" ImageUrl="~/Images/numbers_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="3" Text="&nbsp;Texto corto" ImageUrl="~/Images/textbox_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="4" Text="&nbsp;Texto largo" ImageUrl="~/Images/textbox_multi_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="5" Text="&nbsp;Opción múltiple" ImageUrl="~/Images/select_list_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="6" Text="&nbsp;Selección múltiple" ImageUrl="~/Images/checklist_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="7" Text="&nbsp;Lista desplegable" ImageUrl="~/Images/dropdown_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="8" Text="&nbsp;Fecha" ImageUrl="~/Images/calendar_32.png" ></asp:MenuItem>
                                                                            <asp:MenuItem Value="9" Text="&nbsp;Hora" ImageUrl="~/Images/time_32.png" ></asp:MenuItem>
                                                                        </asp:MenuItem>
                                                                    </Items>
                                                                    <StaticMenuItemStyle CssClass="TipoPreguntaMenuItem"/>
                                                                    <DynamicHoverStyle BackColor="#A4A4A4" ForeColor="White" />
                                                                    <DynamicMenuItemStyle CssClass="TipoPreguntaSubMenuItem" BackColor="#EDF0F4"/>
                                                                </asp:Menu>
                                                            </asp:Panel>--%>
                                                        </asp:TableCell>
                                                        <asp:TableCell Width="80%">
                                                                <%--<asp:Label runat="server" ID="lblDescTipoPregunta" Text='<%# Bind("DescTipoPreguntaProp") %>' CssClass="PreguntaValue"></asp:Label>--%>
                                                                <asp:DropDownList runat="server" ID="cboTipoPregunta" CssClass="PreguntaLabel showColorBackGray NoBorder" Width="100%" OnSelectedIndexChanged="cboTipoPregunta_SelectedIndexChanged" AutoPostBack="true">
                                                                    <asp:ListItem Value="1" Text="&nbsp;Valoración" ></asp:ListItem>
                                                                    <asp:ListItem Value="2" Text="&nbsp;Valor numérico" ></asp:ListItem>
                                                                    <asp:ListItem Value="3" Text="&nbsp;Texto corto" ></asp:ListItem>
                                                                    <asp:ListItem Value="4" Text="&nbsp;Texto largo" ></asp:ListItem>
                                                                    <asp:ListItem Value="5" Text="&nbsp;Opción múltiple" ></asp:ListItem>
                                                                    <asp:ListItem Value="6" Text="&nbsp;Selección múltiple" ></asp:ListItem>
                                                                    <asp:ListItem Value="7" Text="&nbsp;Lista desplegable" ></asp:ListItem>
                                                                    <asp:ListItem Value="8" Text="&nbsp;Fecha" ></asp:ListItem>
                                                                    <asp:ListItem Value="9" Text="&nbsp;Hora" ></asp:ListItem>
                                                                </asp:DropDownList>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <%-- Ejemplo de respuesta de acuerdo al tipo de pregunta --%>
                                        <%--        Valores de las preguntas --%>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <asp:TableRow>
                                            <%-- ///////////////////////// Ejemplos ////////////////////////////////////////////////////////--%>
                                            <asp:TableCell ColumnSpan="2" CssClass="AnswerDesignContent" HorizontalAlign="Center">
                                                <%----------------------------  Valoración ---------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoracion" Visible="false">
                                                    <asp:Image runat="server" ImageUrl="~/Images/filled_star_32.png" />
                                                    <asp:Image runat="server" ImageUrl="~/Images/filled_star_32.png" />
                                                    <asp:Image runat="server" ImageUrl="~/Images/filled_star_32.png" />
                                                    <asp:Image runat="server" ImageUrl="~/Images/empty_star_32.png" />
                                                    <asp:Image runat="server" ImageUrl="~/Images/empty_star_32.png" />

<%--                                                    <asp:Panel runat="server" CssClass="star-rating">
                                                        <asp:HyperLink runat="server" NavigateUrl="#">&nbsp;</asp:HyperLink>
                                                        <asp:HyperLink runat="server" NavigateUrl="#">&nbsp;</asp:HyperLink>
                                                        <asp:HyperLink runat="server" NavigateUrl="#">&nbsp;</asp:HyperLink>
                                                        <asp:HyperLink runat="server" NavigateUrl="#">&nbsp;</asp:HyperLink>
                                                        <asp:HyperLink runat="server" NavigateUrl="#">&nbsp;</asp:HyperLink>
                                                    </asp:Panel>--%>

                                                </asp:Panel>
                                                <%----------------------------  Valor numérico -----------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValorNumerico" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorNumerico" Text="12345" TextMode="Number" ReadOnly="true" CssClass="PreguntaLabel" ></asp:TextBox>
                                                </asp:Panel>
                                                <%----------------------------  Texto corto --------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlTextoCorto" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorTextoCorto" Text="Lorem ipsum dolor sit amet, consectetur cras amet..." TextMode="SingleLine" ReadOnly="true" CssClass="PreguntaLabel" Width="99%" MaxLength="1000"></asp:TextBox>
                                                </asp:Panel>
                                                <%----------------------------  Texto largo --------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlTextoLargo" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorTextoLargo" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam lacus odio, congue sed tincidunt non, aliquam ut ex. Morbi sit amet ante non leo venenatis maximus commodo et odio. Nulla a massa nunc..." TextMode="MultiLine" ReadOnly="true" Rows="2"  CssClass="PreguntaLabel textarea100" resize="none"></asp:TextBox>
                                                </asp:Panel>
                                                <%----------------------------  Opción múltiple ---------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlOpcionMultiple" Visible="false">
                                                    <asp:RadioButtonList runat="server" ID="rdlstValorOpcionMultiple" RepeatColumns="5" CssClass="PreguntaLabel" >
                                                        <asp:ListItem Text="Opción 1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Opción 2"></asp:ListItem>
                                                        <asp:ListItem Text="Opción 3"></asp:ListItem>
                                                        <asp:ListItem Text="Opción 4"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <label for="" class=""></label>
                                                </asp:Panel>
                                                <%----------------------------  Selección múltiple -------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlSeleccionMultiple" Visible="false">
                                                    <asp:CheckBoxList runat="server" ID="chlstValorSeleccionMultiple" RepeatColumns="5" CssClass="PreguntaLabel">
                                                        <asp:ListItem Text="Opción 1"></asp:ListItem>
                                                        <asp:ListItem Text="Opción 2"></asp:ListItem>
                                                    </asp:CheckBoxList>
                                                </asp:Panel>
                                                <%----------------------------  Lista desplegable --------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlListaDesplegable" Visible="false">
                                                    <asp:DropDownList runat="server" ID="ddlstValorListaDesplegable" CssClass="PreguntaLabel large">
                                                        <asp:ListItem Text="Opción 1" class="good"></asp:ListItem>
                                                        <asp:ListItem Text="Opción 2" class="bad"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </asp:Panel>
                                                <%----------------------------  Fecha --------------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlFecha" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorFecha" Text="2020-01-01" TextMode="Date" ReadOnly="true" CssClass="PreguntaLabel"></asp:TextBox>
                                                </asp:Panel>
                                                <%----------------------------  Hora ---------------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlHora" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorHora" Text="12:00" TextMode="Time" ReadOnly="true" CssClass="PreguntaLabel"></asp:TextBox>
                                                </asp:Panel>
                                            </asp:TableCell>
                                            <%-- ///////////////////////// Valores /////////////////////////////////////////////////////////--%>
                                            <asp:TableCell CssClass="PreguntaContent" HorizontalAlign="Left">
                                                <%----------------------------  Valores numericos -----------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoresNumericos" Visible="false">
                                                    <asp:Table runat="server">
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="60%" >
                                                                <asp:Label runat="server" Text="Valor inicial:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%">
                                                                <asp:TextBox runat="server" ID="txtValoresNumericosInicial" TextMode="Number" CssClass="PreguntaGetValues"></asp:TextBox>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="60%">
                                                                <asp:Label runat="server" Text="Valor final:&nbsp;"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%">
                                                                <asp:TextBox runat="server" ID="txtValoresNumericosFinal" TextMode="Number" CssClass="PreguntaGetValues"></asp:TextBox>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>

                                                <%----------------------------  Valores opcion multiple -------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoresOpcionMultiple" Visible="false">
                                                    <asp:Table runat="server" Width="100%">
                                                        <asp:TableRow>
                                                            <asp:TableCell HorizontalAlign="Center" CssClass="showColorBackGray">
                                                                <asp:Label runat="server" Text="Valores" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                                <asp:Table runat="server">
                                                                    <asp:TableRow>
                                                                        <asp:TableCell>
                                                                            <asp:Label runat="server" Text="Valor nuevo:" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                            <asp:TextBox runat="server" ID="txtAddOpcionMultiple" Text="" MaxLength="50" TextMode="SingleLine" CssClass="PreguntaGetValues"></asp:TextBox>
                                                                        </asp:TableCell>
                                                                        <asp:TableCell>
                                                                            <asp:Button runat="server" ID="btnAddOpcionMultiple" Text="Agregar" CssClass="miniBotonAction cursorAdd" CommandName="AddOpcionMultiple" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnModifyList_Command" />
                                                                        </asp:TableCell>
                                                                    </asp:TableRow>
                                                                    <asp:TableRow>
                                                                        <asp:TableCell ColumnSpan="2">
                                                                            <asp:ListBox runat="server" ID="lstbxValoresOpcionMultiple" CssClass="PreguntaGetValues" Width="100%"></asp:ListBox>
                                                                        </asp:TableCell>
                                                                    </asp:TableRow>
                                                                    <asp:TableRow>
                                                                        <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                                                            <asp:Button runat="server" ID="btnDeleteOpcionMultiple" Text="Borrar seleccionado" CssClass="miniBotonAction" CommandName="DeleteOpcionMultiple" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnModifyList_Command" />
                                                                        </asp:TableCell>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>

                                                <%----------------------------  Valores seleccion multiple ----------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoresSeleccionMultiple" Visible="false">
                                                    <asp:Table runat="server" Width="100%">
                                                        <asp:TableRow>
                                                            <asp:TableCell HorizontalAlign="Center" CssClass="showColorBackGray">
                                                                <asp:Label runat="server" Text="Valores&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                                <asp:Table runat="server">
                                                                    <asp:TableRow>
                                                                        <asp:TableCell>
                                                                            <asp:Label runat="server" Text="Valor nuevo:" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                            <asp:TextBox runat="server" ID="txtAddSeleccionMultiple" Text="" MaxLength="50" TextMode="SingleLine" CssClass="PreguntaGetValues"></asp:TextBox>
                                                                        </asp:TableCell>
                                                                        <asp:TableCell>
                                                                            <asp:Button runat="server" ID="btnAddSeleccionMultiple" Text="Agregar" CssClass="miniBotonAction cursorAdd" CommandName="AddSeleccionMultiple" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnModifyList_Command" />
                                                                        </asp:TableCell>
                                                                    </asp:TableRow>
                                                                    <asp:TableRow>
                                                                        <asp:TableCell ColumnSpan="2">
                                                                            <asp:ListBox runat="server" ID="lstbxValoresSeleccionMultiple" CssClass="PreguntaGetValues" Width="100%"></asp:ListBox>
                                                                        </asp:TableCell>
                                                                    </asp:TableRow>
                                                                    <asp:TableRow>
                                                                        <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                                                            <asp:Button runat="server" ID="btnDeleteSeleccionMultiple" Text="Borrar seleccionado" CssClass="miniBotonAction" CommandName="DeleteSeleccionMultiple" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnModifyList_Command" />
                                                                        </asp:TableCell>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>

                                                <%----------------------------  Valores lista desplegable -----------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoresListaDesplegable" Visible="false">
                                                    <asp:Table runat="server" Width="100%">
                                                        <asp:TableRow>
                                                            <asp:TableCell HorizontalAlign="Center" CssClass="showColorBackGray">
                                                                <asp:Label runat="server" Text="Valores" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                                <asp:Table runat="server">
                                                                    <asp:TableRow>
                                                                        <asp:TableCell>
                                                                            <asp:Label runat="server" Text="Valor nuevo:" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                            <asp:TextBox runat="server" ID="txtAddListaDesplegable" Text="" MaxLength="50" TextMode="SingleLine" CssClass="PreguntaGetValues"></asp:TextBox>
                                                                        </asp:TableCell>
                                                                        <asp:TableCell>
                                                                            <asp:Button runat="server" ID="btnAddListaDesplegable" Text="Agregar" CssClass="miniBotonAction cursorAdd" CommandName="AddListaDesplegable" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnModifyList_Command" />
                                                                        </asp:TableCell>
                                                                    </asp:TableRow>
                                                                    <asp:TableRow>
                                                                        <asp:TableCell ColumnSpan="2">
                                                                            <asp:ListBox runat="server" ID="lstbxValoresListaDesplegable" CssClass="PreguntaGetValues" Width="100%"></asp:ListBox>
                                                                        </asp:TableCell>
                                                                    </asp:TableRow>
                                                                    <asp:TableRow>
                                                                        <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                                                            <asp:Button runat="server" ID="btnDeleteListaDesplegable" Text="Borrar seleccionado" CssClass="miniBotonAction" CommandName="DeleteListaDesplegable" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnModifyList_Command" />
                                                                        </asp:TableCell>
                                                                    </asp:TableRow>
                                                                </asp:Table>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>

                                                <%----------------------------  Valores fecha -----------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoresFecha" Visible="false">
                                                    <asp:Table runat="server">
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="60%" >
                                                                <asp:Label runat="server" Text="Desde:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%">
                                                                <asp:TextBox runat="server" ID="txtValoresFechaDesde" TextMode="Date" CssClass="PreguntaGetValues"></asp:TextBox>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="60%">
                                                                <asp:Label runat="server" Text="Hasta:&nbsp;"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%">
                                                                <asp:TextBox runat="server" ID="txtValoresFechaHasta" TextMode="Date" CssClass="PreguntaGetValues"></asp:TextBox>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>

                                                <%----------------------------  Valores hora -----------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoresHora" Visible="false">
                                                    <asp:Table runat="server">
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="60%" >
                                                                <asp:Label runat="server" Text="Desde:&nbsp;" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%">
                                                                <asp:TextBox runat="server" ID="txtValoresHoraDesde" TextMode="Time" CssClass="PreguntaGetValues"></asp:TextBox>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="60%">
                                                                <asp:Label runat="server" Text="Hasta:&nbsp;"></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%">
                                                                <asp:TextBox runat="server" ID="txtValoresHoraHasta" TextMode="Time" CssClass="PreguntaGetValues"></asp:TextBox>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <%-- Precedencia, Obligatoria, Condicion, acciones --%>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <asp:TableRow>
                                            <asp:TableCell ColumnSpan="3" CssClass="AnswerDesignContent">
                                                <asp:Panel runat="server">
                                                    <asp:Table runat="server" Width="100%">
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="10%">
                                                                <asp:Label runat="server" Text="Precedencia" CssClass="PreguntaGetValuesLabel" ></asp:Label>
                                                                <br />
                                                                <asp:DropDownList runat="server" ID="cboPredecencia" DataTextField="PrecedenciaProp" DataValueField="PrecedenciaProp" CssClass="PreguntaGetValues"></asp:DropDownList>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="10%">
                                                                <asp:Label runat="server" Text="Pregunta padre" CssClass="PreguntaGetValuesLabel" ></asp:Label>
                                                                <br />
                                                                <asp:DropDownList runat="server" ID="cboPreguntaPadre" DataTextField="PrecedenciaProp" DataValueField="idPreguntaProp" CssClass="PreguntaGetValues"></asp:DropDownList>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="20%">
                                                                <asp:CheckBox runat="server" ID="chkPreguntaRequeridaEdit" Checked='<%# Eval("ObligatoriaProp") %>' Text="Pregunta requerida" />
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="40%" HorizontalAlign="Center">
                                                                <asp:Label runat="server" Text="Mostrar si la respuesta del padre es" CssClass="PreguntaGetValuesLabel"></asp:Label>
                                                                <asp:TextBox runat="server" ID="txtCondicionPresentacion" Text='<%# Eval("ValorCondicionProp") %>' TextMode="SingleLine" MaxLength="50" CssClass="PreguntaGetValues text100"></asp:TextBox>
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="5%" HorizontalAlign="Center">&nbsp;</asp:TableCell>
                                                            <asp:TableCell Width="5%" HorizontalAlign="Center">
                                                                <asp:Button runat="server" ID="btnPreguntaDescartar" Text="Descartar" CssClass="botonAction" OnClick="btnPreguntaDescartar_Click" />
                                                            </asp:TableCell>
                                                            <asp:TableCell Width="5%" HorizontalAlign="Center">&nbsp;</asp:TableCell>
                                                            <asp:TableCell Width="5%" HorizontalAlign="Center">
                                                                <asp:Button runat="server" ID="btnPreguntaGuardar" Text="Guardar" CssClass="botonAction" OnClick="btnPreguntaGuardar_Click" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" />
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:Panel>

                            </EditItemTemplate>

                            <%-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --%>
                            <%-- ////////////////////// Footer Templeate  //////////////////////////////////////////////////////////////////////////// --%>
                            <%-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --%>

                            <FooterTemplate>
                                <asp:Panel runat="server" ID="pnlSeccionFooter" CssClass="SeccionPreguntasContentFooter NoBorder" Width="100%" >
                                    <asp:Table runat="server" Width="100%" CssClass="NoBorder">
                                        <asp:TableRow>
                                            <asp:TableCell Width="100%" HorizontalAlign="Right" VerticalAlign="Middle">
                                                <asp:ImageButton runat="server" ID="btnAddPregunta" ImageUrl="~/Images/Add48.png" ToolTip="Agregar pregunta" CommandName="AddQuestion" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" OnCommand="btnAddQuestion_Command"  />
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:Panel>

                                <asp:Button runat="server" ID="btnAddSeccion" Text="+ Agregar sección" CssClass="ButtonCompleteWide" OnClick="btnAddSeccion_Click" />
                                <asp:Panel runat="server" ID="pnlAddSeccionFooter" CssClass="SeccionPreguntasContent NoBorder" HorizontalAlign="Left">
                                </asp:Panel>

                            </FooterTemplate>

                        </asp:TemplateField>
                    </Columns>
                    <SelectedRowStyle BackColor="#A4A4A4" />
                </asp:GridView>

            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnGuardarNombreSeccion" />
            <asp:PostBackTrigger ControlID="btnGuardarEncuesta" />
            <asp:PostBackTrigger ControlID="btnDeleteSeccionConfirmar" />
            <asp:PostBackTrigger ControlID="btnGuardarAddSeccion" />
            <asp:PostBackTrigger ControlID="btnGuardarAddPregunta" />
            <asp:PostBackTrigger ControlID="btnCancelarCambiosEncuesta" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>

