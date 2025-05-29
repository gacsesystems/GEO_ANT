<%@ Page Title="Encuesta" Language="vb" AutoEventWireup="false" MasterPageFile="~/Survey.Master" CodeBehind="UserSurvey.aspx.vb" Inherits="GEO.UserSurvey" %>

<%@ MasterType VirtualPath="~/Survey.Master" %>

<%@ Import Namespace="GEO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SurveyHead" runat="server">

    <link href="../Content/SpecialRadioCheckBox.css" rel="stylesheet" />
    <link href="../Login/LoginMessage.css" rel="stylesheet" />

    <%----------------------------   SCRIPTS  -------------------------------------------------------------------------------%>
    <script type="text/javascript">

        function clickOnce(btn, msg) {

            btn.value = msg;
            btn.disabled = true;
            return true;
        }

        function validarNum(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 8) return true;
            patron = /\d/;
            te = String.fromCharCode(tecla);
            return patron.test(te);
        }

        function quitaNoNumero(obj) {
            patron = /\d/;
            if (!patron.test(obj.value)) {
                obj.value = "";
            }
        }

        function xMuestraOcultaDependencias(lxObj, fsValor) {
            var lsCmdW = "[id*=";
            lsCmdW = lsCmdW.concat(lxObj.id, "]");

            //$("[id*=nombre]").hide();
            if (lxObj.value == fsValor) {
                //$(lsCmdW).hide();
                //lxObj.hide();
                //lxObj.style.display = 'none';
                //$("[id*=SurveyContent_grdPreguntas_txtValorNumerico_5]").hide();
                //$("[id*=SurveyContent_grdPreguntas_pnlSeccionDetail_5]").style.display = 'none';
                
                //document.getElementById("SurveyContent_grdPreguntas_pnlSeccionDetail_5").style.display = 'none';

                //var x = document.getElementById("SurveyContent_grdPreguntas_pnlSeccionDetail_5");
                //x.className = 'ocultar';
                //x.style.display = 'none';
                //lxObj.hidden=true;


                //var animalType = animal.getAttribute("data-animal-type");
                //var animalType = animal.dataset.animalType;


                //$('#fieldId').attr('disabled', 'disabled'); //Disable
                //$('#fieldId').removeAttr('disabled'); //Enable
                //document.getElementById("SurveyContent_grdPreguntas_pnlSeccionDetail_5").className = 'ocultar';


                //var lista = document.getElementsByName("pnlValorNumericoName");
                //for (var i = 0; i < lista.length; i++) {
                //    lista[i].hidden = true;
                //    alert(lista[i].id);
                //}

                alert(lsCmdW.concat(" ... Ocultar"));
            }

        }

        function MuestraOcultaDependencias(lxObj) {

            /*
                Tipo de pregunta:
                1 - Valoración
                2 - Valor numérico
                3 - Texto corto
                4 - Texto largo
                5 - Opción múltiple
                6 - Selección múltiple
                7 - Lista desplegable
                8 - Fecha
                9 - Hora
             */

            //Evalua si el objeto tiene ID de pregunta
            if (lxObj.dataset.idpregunta) {

                //Evalua si el objeto tiene valor
                var lsValor = '(empty)';
                if (lxObj.value) {
                    lsValor = lxObj.value;
                }
                else {
                    if (lxObj.dataset.tipopregunta) {
                        if ((lxObj.dataset.tipopregunta == '5') || (lxObj.dataset.tipopregunta == '6') || (lxObj.dataset.tipopregunta == '7')) {
                            //lsValor = lxObj.dataset.listindex;
                            lsValor = lxObj.dataset.listvalue;
                        }
                        else if (lxObj.dataset.tipopregunta == '1') {
                            lsValor = lxObj.dataset.listindex;
                        }
                    }
                }

                var lsIdPregunta = lxObj.dataset.idpregunta;
                //alert(lsIdPregunta.concat("  - -  ").concat(lsValor));

                //Obtiene todos los div de la pagina
                var lista = document.getElementsByTagName("DIV");

                //
                for (var i = 0; i < lista.length; i++) {
                    if (lista[i].dataset.idpadre) {                         //solo los div con el atributo idpadre
                        if (lista[i].dataset.idpadre != "_sin_padre_") {    //solo los div con el atributo idpadre <> _sin_padre_
                            //alert(lista[i].dataset.idpadre.concat(" = idpadre"));

                            if (lista[i].dataset.valorcondicionpadre) {                         //solo los div con el atributo valorcondicionpadre
                                if (lista[i].dataset.valorcondicionpadre != "_sin_valor_") {    //solo los div con el atributo valorcondicionpadre <> _sin_valor_
                                    //alert(lista[i].dataset.valorcondicionpadre.concat(" = valorcondicionpadre"));

                                    if (lista[i].dataset.idpadre == lsIdPregunta) {    //solo los div con el atributo idpadre = idPregunta del Padre
                                        //alert("idPadre = lsIdPregunta");
                                        //alert(lsValor.toUpperCase().concat(" = lsValor"));

                                        if (lista[i].dataset.valorcondicionpadre.toUpperCase() != lsValor.toUpperCase()) {
                                            //alert(lista[i].dataset.valorcondicionpadre.toUpperCase().concat(" != ").concat(lsValor.toUpperCase()));
                                            lista[i].hidden = true;
                                            //alert("Oculta el DIV, hidden = true");
                                        }
                                        else {
                                            lista[i].hidden = false;
                                            //lista[i].style.display = 'block';
                                            //alert("Muestra el DIV, hidden = false");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

            }
            else {
                //alert('sin IdPregunta');
            }
            return true;

        }

        //////////////////////////////////////////

        function xCambiaValorRespuesta(fldSender) {
            var gv = document.getElementById("<%=grdPreguntas.ClientID%>");
            var flds = gv.getElementsByTagName("input");
            //var row = rb.parentNode.parentNode;
            for (var i = 0; i < flds.length; i++) {
                //alert(flds[i].type);
                if (flds[i].type == "text") {
                    //if (flds[i].checked && flds[i] != fldSender) {
                    //    flds[i].checked = false;
                    //    break;
                    //}

                    alert(flds[i].name);
                    alert(flds[i].parentElement.parentElement.parentElement.name);
                    flds[i].hidden = true;
                        break;

                }
            }
            return true;
        }


    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SurveyContent" runat="server">

    <asp:UpdatePanel ID="updpnlMainContent" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
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
            <asp:Panel ID="pnlMessage" runat="server" CssClass="SurveyMessageScreenContainer" Visible="False">
                <asp:ImageButton ID="imgMessage" runat="server" ImageUrl="~/Images/Exclamation32.png" CssClass="MessageImage" />
                <asp:Label ID="lblMessage" runat="server" Text="" CssClass="MessageScreen"></asp:Label>
                <asp:Button runat="server" ID="btnCloseMessage" Text="&times;" CssClass="closebtn" />
            </asp:Panel>
            <%----------------------------   Notificacion  -------------------------------------------------------------------------------%>
            <asp:Panel runat="server" ID="pnlGlobalNotification" CssClass="ctrl" Visible="false">
                <asp:Label ID="lblGlobalNotification" runat="server" Text="&nbsp;" CssClass="messageNotification animateOpen"></asp:Label>
            </asp:Panel>

            <%----------------------------   Cuerpo  --------------------------------------------------------------------------------%>
            <asp:Panel runat="server" ID="pnlCuerpo" CssClass="GridStyleContainer NoBorder" HorizontalAlign="Center" Visible="false">

                <asp:HiddenField runat="server" ID="hidSimulacion" Value="0" />
                <asp:HiddenField runat="server" ID="hidEMail" Value="" />
                <asp:HiddenField runat="server" ID="hidFechaInicial" Value="" />

                <asp:Panel runat="server" ID="pnlIntroduccion">
                    <asp:Label runat="server" Text="Nos interesa mucho su opinión, por eso le invitamos a contestar una breve encuesta de satisfacción, esto nos servirá para mejorar la experiencia y la atención que usted merece.<br>Muchas gracias de antemano por su tiempo."></asp:Label>
                </asp:Panel>

                <asp:GridView ID="grdPreguntas" runat="server" AutoGenerateColumns="False" DataKeyNames="idPreguntaProp,idSeccionProp" EnablePersistedSelection="True" AllowPaging="False" ShowHeaderWhenEmpty="true" ShowHeader="true" ShowFooter="true" EmptyDataText="&nbsp;No hay preguntas para esta encuesta&nbsp;" CssClass="NoBorder VerticalSpace" EmptyDataRowStyle-CssClass="NoBorder GridEmptyDataRowStyle" GridLines="None" Width="100%">
                    <Columns>
                        <asp:TemplateField>

                            <ItemTemplate>

                                <%----------------------------   Header Seccion --------------------------------------------------------------------------%>
                                <asp:Panel runat="server" ID="pnlSeccionHeader" CssClass="SeccionPreguntasContent NoBorder VerticalSpace">
                                    <asp:Table runat="server" Width="100%" CssClass="NoBorder">
                                        <asp:TableRow CssClass="SeccionPreguntasName">
                                            <asp:TableCell Width="100%" HorizontalAlign="Left" ColumnSpan="2">
                                                <asp:Label runat="server" ID="lblNombreSeccion" Text='<%# Eval("NombreSeccionProp") %>'></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:Panel>

                                <%----------------------------   Detail Seccion --------------------------------------------------------------------------%>
                                <asp:Panel runat="server" ID="pnlSeccionDetail" CssClass="PreguntaContent" >
                                    <asp:Table runat="server" Width="100%" CssClass="NoBorder LittleVerticalMargin">
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <%-- Consecutivo, Pregunta, Respuesta 1 --%>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <asp:TableRow>
<%--                                            <asp:TableCell Width="5%" HorizontalAlign="Center">
                                                <asp:Label runat="server" ID="lblConsecutivoPregunta" Text='<%# Eval("PrecedenciaProp") %>' CssClass="PreguntaConsecutive" name=""></asp:Label>
                                            </asp:TableCell>--%>
                                            <asp:TableCell Width="75%" CssClass="PreguntaContent NoBorder" HorizontalAlign="Left">
                                                <asp:Image runat="server" ID="imgPreguntaObligatoria" ImageUrl="~/Images/aterisco16.png" Visible='<%# Eval("ObligatoriaProp") %>' />&nbsp;
                                                <asp:Label runat="server" Text='<%# Eval("PreguntaProp") %>' CssClass="CellDataValue"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell Width="25%" CssClass="PreguntaContent NoBorder" HorizontalAlign="Left">
                                                <%----------------------------  Valoración ---------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValoracion" Visible="false" >
                                                    <asp:Panel runat="server" ID="pnlStarValoracionContent" Width="100%">
                                                        <asp:Panel runat="server" ID="pnlStarValoracionLabel" CssClass="starRatingValoracionLabel">
                                                            <asp:Label runat="server" ID="lblNumeroValoracion" Text="0" CssClass="StarsLabel" Visible="false"></asp:Label>
                                                            <asp:Image runat="server" ID="imgStarValoracionLabel" ImageUrl="~/Images/filled_star_32.png" Visible="false" />

                                                            <asp:Image runat="server" ID="imgStarValoracion1" ImageUrl="~/Images/empty_star_32.png" />&nbsp;
                                                            <asp:Image runat="server" ID="imgStarValoracion2" ImageUrl="~/Images/empty_star_32.png" />&nbsp;
                                                            <asp:Image runat="server" ID="imgStarValoracion3" ImageUrl="~/Images/empty_star_32.png" />&nbsp;
                                                            <asp:Image runat="server" ID="imgStarValoracion4" ImageUrl="~/Images/empty_star_32.png" />&nbsp;
                                                            <asp:Image runat="server" ID="imgStarValoracion5" ImageUrl="~/Images/empty_star_32.png" />&nbsp;
                                                        </asp:Panel>
                                                        <asp:Panel runat="server" ID="pnlStarValoracionValue" CssClass="starRatingValoracion NoBorder">
                                                            <asp:Panel runat="server" CssClass="star-rating" >
<%--                                                                <asp:LinkButton runat="server" ID="btnValoracion1" Text="&nbsp;" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Star1" OnCommand="btnValoracion_Command" OnClientClick="MuestraOcultaDependencias(this);" PostBackUrl="#" Visible="false" />
                                                                <asp:LinkButton runat="server" ID="btnValoracion2" Text="&nbsp;" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Star2" OnCommand="btnValoracion_Command" OnClientClick="MuestraOcultaDependencias(this);" PostBackUrl="#" Visible="false" />
                                                                <asp:LinkButton runat="server" ID="btnValoracion3" Text="&nbsp;" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Star3" OnCommand="btnValoracion_Command" OnClientClick="MuestraOcultaDependencias(this);" PostBackUrl="#" Visible="false" />
                                                                <asp:LinkButton runat="server" ID="btnValoracion4" Text="&nbsp;" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Star4" OnCommand="btnValoracion_Command" OnClientClick="MuestraOcultaDependencias(this);" PostBackUrl="#" Visible="false" />
                                                                <asp:LinkButton runat="server" ID="btnValoracion5" Text="&nbsp;" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Star5" OnCommand="btnValoracion_Command" OnClientClick="MuestraOcultaDependencias(this);" PostBackUrl="#" Visible="false" />--%>

                                                                <asp:ImageButton runat="server" ID="btnValoracion1" Text="&nbsp;" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Star1" OnCommand="btnValoracion_Command" OnClientClick="MuestraOcultaDependencias(this);" ImageUrl="~/Images/empty_picture_1px.png" />
                                                                <asp:ImageButton runat="server" ID="btnValoracion2" Text="&nbsp;" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Star2" OnCommand="btnValoracion_Command" OnClientClick="MuestraOcultaDependencias(this);" ImageUrl="~/Images/empty_picture_1px.png" />
                                                                <asp:ImageButton runat="server" ID="btnValoracion3" Text="&nbsp;" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Star3" OnCommand="btnValoracion_Command" OnClientClick="MuestraOcultaDependencias(this);" ImageUrl="~/Images/empty_picture_1px.png" />
                                                                <asp:ImageButton runat="server" ID="btnValoracion4" Text="&nbsp;" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Star4" OnCommand="btnValoracion_Command" OnClientClick="MuestraOcultaDependencias(this);" ImageUrl="~/Images/empty_picture_1px.png" />
                                                                <asp:ImageButton runat="server" ID="btnValoracion5" Text="&nbsp;" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Star5" OnCommand="btnValoracion_Command" OnClientClick="MuestraOcultaDependencias(this);" ImageUrl="~/Images/empty_picture_1px.png" />

                                                                <asp:HiddenField runat="server" ID="hidValoracion" Value="0" />                                                    
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                </asp:Panel>
                                                <%----------------------------  Valor numérico -----------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlValorNumerico" Visible="false" >
                                                    <asp:TextBox runat="server" ID="txtValorNumerico" Text="" TextMode="Number" CssClass="PreguntaLabel" onkeypress="return validarNum(event)" onchange="quitaNoNumero(this); MuestraOcultaDependencias(this);" step="1" title="Escriba un valor numérico entre 0 y 999,999" OnTextChanged="txtValorNumerico_TextChanged"></asp:TextBox>
                                                    <%--Min='<%# Eval("NumeroMinimoProp") %>' Max='<%# Eval("NumeroMaximoProp") %>' --%>
                                                </asp:Panel>
                                                <%----------------------------  Lista desplegable --------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlListaDesplegable" Visible="false">
                                                    <asp:DropDownList runat="server" ID="ddlstValorListaDesplegable" CssClass="PreguntaLabel large" Width="100%" onchange="MuestraOcultaDependencias(this);">
                                                    </asp:DropDownList>
                                                </asp:Panel>
                                                <%----------------------------  Fecha --------------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlFecha" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorFecha" Text="" TextMode="Date" CssClass="PreguntaLabel" onchange="MuestraOcultaDependencias(this);"></asp:TextBox>
                                                    <%--Min='<%# Eval("FechaHoraDesdeProp", "{0:yyyy-MM-dd}") %>' Max='<%# Eval("FechaHoraHastaProp", "{0:yyyy-MM-dd}") %>'--%>
                                                </asp:Panel>
                                                <%----------------------------  Hora ---------------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlHora" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorHora" Text="" TextMode="Time" CssClass="PreguntaLabel" onchange="MuestraOcultaDependencias(this);"></asp:TextBox>
                                                    <%--Min='<%# Eval("FechaHoraDesdeProp", "{0:HH:mm}") %>' Max='<%# Eval("FechaHoraHastaProp", "{0:HH:mm}") %>'--%>
                                                </asp:Panel>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <%-- Ejemplo de respuesta de acuerdo al tipo de pregunta --%>
                                        <%--        Valores de las preguntas --%>
                                        <%-- ////////////////////////////////////////////////////////////////////////////////////////////// --%>
                                        <asp:TableRow>
                                            <%-- ///////////////////////// Ejemplos ////////////////////////////////////////////////////////--%>
                                            <asp:TableCell ColumnSpan="3" CssClass="AnswerDesignConten NoBorder" HorizontalAlign="Right">
                                                <%----------------------------  Texto corto --------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlTextoCorto" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorTextoCorto" Text="" TextMode="SingleLine" CssClass="PreguntaLabel LittleVerticalMargin" Width="99%" MaxLength="256" onchange="MuestraOcultaDependencias(this);"></asp:TextBox>
                                                </asp:Panel>
                                                <%----------------------------  Texto largo --------------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlTextoLargo" Visible="false">
                                                    <asp:TextBox runat="server" ID="txtValorTextoLargo" Text="" TextMode="MultiLine" Rows="3" CssClass="PreguntaLabel textarea100 LittleVerticalMargin" resize="none" MaxLength="1000" onchange="MuestraOcultaDependencias(this);"></asp:TextBox>
                                                </asp:Panel>
                                                <%----------------------------  Opción múltiple ---------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlOpcionMultiple" Visible="false">
                                                    <asp:RadioButtonList runat="server" ID="rdlstValorOpcionMultiple" RepeatColumns="5" CssClass="PreguntaLabel" onchange="MuestraOcultaDependencias(this);">
                                                    </asp:RadioButtonList>
                                                    <label for="" class=""></label>
                                                </asp:Panel>
                                                <%----------------------------  Selección múltiple -------------------------------------------------------%>
                                                <asp:Panel runat="server" ID="pnlSeleccionMultiple" Visible="false">
                                                    <asp:CheckBoxList runat="server" ID="chlstValorSeleccionMultiple" RepeatColumns="5" CssClass="PreguntaLabel" onchange="MuestraOcultaDependencias(this);">
                                                    </asp:CheckBoxList>
                                                </asp:Panel>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:Panel>

                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:Panel runat="server" HorizontalAlign="Left" CssClass="LittleVerticalMargin">
                                    <asp:Image runat="server" ID="imgPreguntasObligatoria" ImageUrl="~/Images/aterisco16.png" />
                                    <asp:Label runat="server" Text="Preguntas obligatorias"></asp:Label>
                                </asp:Panel>
                                <asp:Button runat="server" ID="btnSendSurvey" Text="E n v i a r    r e s p u e s t a s" CssClass="ButtonCompleteWideAnswers" OnClick="btnSendSurvey_Click" />
                                <%--OnClientClick="clickOnce(this, 'Enviando respuestas...')"--%>
                            </FooterTemplate>

                        </asp:TemplateField>
                    </Columns>
                    <%--<AlternatingRowStyle CssClass="AnswerAlternateRow" />--%>
                </asp:GridView>


            </asp:Panel>

            <%----------------------------   Mensajes  ------------------------------------------------------------------------------%>
            <asp:Panel runat="server" ID="pnlAvisoNoEncuesta" Visible="false" CssClass="AvisoEncuestaNoDisponible" Width="100%" HorizontalAlign="Center">
                &nbsp;
                <asp:Label runat="server" ID="lblAvisoNoEncuesta" Text="" Width="100%">&nbsp;</asp:Label>
                &nbsp;
            </asp:Panel>


        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

