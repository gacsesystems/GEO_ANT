<%@ Page Title="Reportes del cliente" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ReportesClientes.aspx.vb" Inherits="GEO.ReportesClientes" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845DCD8080CC91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/SpecialRadioCheckBox.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

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

    <%----------------------------   Cuerpo  -------------------------------------------------------------------------------%>
    <asp:Panel runat="server" ID="pnlCuerpo" Width="100%">

        <asp:Panel runat="server" ID="pnlFiltros" Width="100%">
            <asp:Table runat="server" Width="100%" HorizontalAlign="Center" CssClass="VerticalSpace">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                        <asp:Label runat="server" Text="Reporte:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>&nbsp;</asp:TableCell>
                    <asp:TableCell>
                        <asp:RadioButtonList runat="server" ID="rdlstReportes" RepeatColumns="2" CssClass="DetailPreguntaGetValues">
                            <asp:ListItem Text="Respuestas por Encuesta - Detallado" Value="1" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Resumen por Pregunta" Value="2"></asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="VerticalSpace"><asp:TableCell ColumnSpan="3">&nbsp;</asp:TableCell></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                        <asp:Label runat="server" Text="Encuesta:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>&nbsp;</asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" ID="cboEncuestas" DataTextField="NombreEncuestaProp" DataValueField="idEncuestaProp" CssClass="DetailPreguntaGetValues"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="VerticalSpace"><asp:TableCell ColumnSpan="3">&nbsp;</asp:TableCell></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                        <asp:Label runat="server" Text="Desde:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>&nbsp;</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtFechaDesde" Text="" TextMode="Date" CssClass="DetailPreguntaGetValues"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="VerticalSpace"><asp:TableCell ColumnSpan="3">&nbsp;</asp:TableCell></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Right" CssClass="DetailPreguntaGetValuesLabel">
                        <asp:Label runat="server" Text="Hasta:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>&nbsp;</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtFechaHasta" Text="" TextMode="Date" CssClass="DetailPreguntaGetValues"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="VerticalSpace"><asp:TableCell ColumnSpan="3">&nbsp;</asp:TableCell></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3" HorizontalAlign="Center">
                        <asp:Button runat="server" ID="btnEmiteReporte" Text="Emitir reporte" CssClass="botonAction" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlReporte" Visible="false" CssClass="ReportContent" HorizontalAlign="Center">
            <br />
            <rsweb:ReportViewer ID="repvwReportesCliente" Visible="false" Width="100%" runat="server" ShowExportControls="true" ShowFindControls="true" ShowPageNavigationControls="true" ShowToolBar="true" ShowZoomControl="true" ShowBackButton="false" AsyncRendering="false" SizeToReportContent="false" HyperlinkTarget="_blank" KeepSessionAlive="true" ShowPrintButton="true" ShowReportBody="true">
                <%--ShowPrintButton="true" ShowReportBody="true" ProcessingMode="Local" ZoomMode="PageWidth" --%>
                <LocalReport DisplayName="Reportes del cliente" ReportPath="">
                </LocalReport>
            </rsweb:ReportViewer>
            <br>
            <asp:Button runat="server" ID="btnCerrarReporte" Text="Regresar" CssClass="botonAction" />
        </asp:Panel>

    </asp:Panel>

</asp:Content>

