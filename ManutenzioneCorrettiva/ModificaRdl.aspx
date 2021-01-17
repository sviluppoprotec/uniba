<%@ Page Language="c#" CodeBehind="ModificaRdl.aspx.cs" AutoEventWireup="false" Inherits="TheSite.ManutenzioneCorretiva.ModificaRdl" %>

<%@ Register TagPrefix="uc1" TagName="UserStanze" Src="../WebControls/UserStanze.ascx" %>
<%@ Register TagPrefix="MessPanel" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="uc1" TagName="CodiceApparecchiature" Src="../WebControls/CodiceApparecchiature.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="RichiedentiSollecito" Src="../WebControls/RichiedentiSollecito.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Richiedenti" Src="../WebControls/Richiedenti.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RicercaModulo" Src="../WebControls/RicercaModulo.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>CreazioneRdl</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
    <script language="javascript">

        function clearRoom() {
            document.getElementById("<%=UserStanze1.s_TxtIdStanza.ClientID%>").value = "";
     document.getElementById("<%=UserStanze1.s_TxtDescStanza.ClientID%>").value = "";
        }

        function disableControl() {
            var ctrl = document.forms[0];
            iterator(ctrl);
        }

        function iterator(senser) {
            var count = document.forms[0].elements.length;
            for (i = 0; i < count; i++) {
                var element = document.forms[0].elements[i];
                if (element.type == 'select-one') {
                    element.disabled = true;
                }

            }
        }

        function ClearApparechiature() {
            var ctrltxtapp = document.getElementById('<%=CodiceApparecchiature1.s_CodiceApparecchiatura.ClientID%>');
        if (ctrltxtapp != null && ctrltxtapp != 'undefined') {
            ctrltxtapp.value = "";
            document.getElementById('<%=CodiceApparecchiature1.CodiceHidden.ClientID%>').value = "";
            }
        }

        function ControllaBL(nome) {
            if (document.getElementById(nome).value == "") {
                alert('Inserire il Codice Edificio');
                return false;
            }
            return true;
        }
        function DivSetVisible(state) {
            var DivRef = document.getElementById('pnlShowInfo');
            var IfrRef = document.getElementById('DivShim');
            if (state) {
                DivRef.style.display = "block";
                IfrRef.style.width = DivRef.offsetWidth;
                IfrRef.style.height = DivRef.offsetHeight;
                IfrRef.style.top = DivRef.style.top;
                IfrRef.style.left = DivRef.style.left;
                IfrRef.style.zIndex = DivRef.style.zIndex - 1;
                IfrRef.style.display = "block";
            }
            else {
                DivRef.style.display = "none";
                IfrRef.style.display = "none";
            }
        }

        function EmesseSetVisible(state) {
            var DivRef = document.getElementById('PanelEmesse');
            var IfrRef = document.getElementById('DivEmesse');
            if (state) {
                DivRef.style.display = "block";
                IfrRef.style.width = DivRef.offsetWidth;
                IfrRef.style.height = DivRef.offsetHeight;
                IfrRef.style.top = DivRef.style.top;
                IfrRef.style.left = DivRef.style.left;
                IfrRef.style.zIndex = DivRef.style.zIndex - 1;
                IfrRef.style.display = "block";
            }
            else {
                DivRef.style.display = "none";
                IfrRef.style.display = "none";
            }


        }
        function visibletextmail(sender, controlid) {
            document.getElementById(controlid).disabled = !document.getElementById(sender).checked;
        }

    </script>
</head>
<body onbeforeunload="parent.left.valorizza()" bottommargin="0" leftmargin="5" topmargin="0"
    rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <table id="TableMain" style="z-index: 101; left: 0px; width: 100%; position: absolute; top: 0px; height: 100%"
            cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
            <tr>
                <td style="height: 50px" align="center">
                    <uc1:PageTitle ID="PageTitle1" Title="Inserimento Richieste" runat="server"></uc1:PageTitle>
                </td>
            </tr>
            <tr>
                <td valign="top" align="center" height="98%">
                    <table id="tblFormInput" cellspacing="1" cellpadding="1" align="center">
                        <tr>
                            <td style="width: 3%; height: 5%" valign="top" align="left"></td>
                            <td style="height: 3%" valign="top" align="left"></td>
                        </tr>
                        <tr>
                            <td style="height: 1%" valign="top" align="left"></td>
                            <td style="height: 1%" valign="top" align="left">
                                <hr noshade size="1">
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="center"></td>
                            <td valign="top" align="left">
                                <table id="tblSearch95" cellspacing="1" cellpadding="1" border="0">
                                    <tr>
                                        <td align="center" colspan="4">
                                            <asp:Panel ID="PanelRichiedente" runat="server">
                                                <table id="TableRichiedente" style="width: 100%" cellspacing="1" cellpadding="1" border="0">
                                                    <tr>
                                                        <td width="25%" colspan="4">
                                                            <uc1:RichiedentiSollecito ID="RichiedentiSollecito1" runat="server"></uc1:RichiedentiSollecito>
                                                            <asp:RequiredFieldValidator ID="rfvRichiedenteNome" runat="server" ErrorMessage="Indicare il Nome del Richiedente">*</asp:RequiredFieldValidator>
                                                            <asp:RequiredFieldValidator ID="rfvRichiedenteCognome" runat="server" ErrorMessage="Indicare il Cognome del Richiedente">*</asp:RequiredFieldValidator></td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="4">
                                            <table id="TableRicercaModulo" style="width: 100%" cellspacing="1" cellpadding="1" border="0">
                                                <tr>
                                                    <td>
                                                        <uc1:RicercaModulo ID="RicercaModulo1" runat="server"></uc1:RicercaModulo>
                                                        <asp:RequiredFieldValidator ID="rfvEdificio" runat="server" ErrorMessage="Selezionare un Edificio">*</asp:RequiredFieldValidator></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>Descrizione Intervento Richiesto:
                                                    </td>
                                                </tr>
                                            </table>
                                            <table class="tblSearch100Dettaglio" style="width: 100%" cellspacing="1" cellpadding="1"
                                                border="0">
                                                <tr>
                                                    <td width="10%">Telefono</td>
                                                    <td align="left" width="20%">
                                                        <cc1:S_TextBox ID="txtsTelefonoRichiedente" runat="server" DBParameterName="p_Phone" DBSize="20"
                                                            DBIndex="3" MaxLength="50"></cc1:S_TextBox></td>
                                                    <td width="10%">Nota</td>
                                                    <td align="left" width="40%">
                                                        <cc1:S_TextBox ID="txtsNota" runat="server" DBParameterName="p_Nota_Ric" DBSize="2000" DBIndex="4"
                                                            MaxLength="2000" Width="100%" TextMode="MultiLine" Rows="2"></cc1:S_TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">Piano
															<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Selezionare un piano"
                                                                ControlToValidate="cmbsPiano">*</asp:RequiredFieldValidator>
                                                    </td>
                                                    <td align="left" width="20%">
                                                        <cc1:S_ComboBox ID="cmbsPiano" runat="server" DBParameterName="p_id_piani" DBSize="10" DBIndex="17"
                                                            Width="200px" DBDirection="Input" DBDataType="Integer">
                                                        </cc1:S_ComboBox></td>
                                                    <td width="10%" colspan="2">&nbsp;
															<uc1:UserStanze ID="UserStanze1" runat="server"></uc1:UserStanze>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="4">
                                            <asp:LinkButton ID="lkbNonEmesse" runat="server" CssClass="LabelInfo" CausesValidation="False" Visible="False">Richieste non Emesse</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="pnlShowInfo" Style="display: none; z-index: 100; color: #ffffff; position: absolute; background-color: gainsboro"
                                                runat="server" Width="100%">
                                                <table height="100%" width="100%">
                                                    <tr>
                                                        <td class="TitleSearch" valign="top" align="right">
                                                            <asp:LinkButton ID="lnkChiudi" runat="server" CausesValidation="False" CssClass="LabelChiudi">Chiudi</asp:LinkButton></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:DataGrid ID="DataGridRicerca" runat="server" CssClass="DataGrid" AllowPaging="True" GridLines="Vertical"
                                                                AutoGenerateColumns="False" BorderWidth="1px" BorderColor="Gray">
                                                                <AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
                                                                <ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
                                                                <HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
                                                                <Columns>
                                                                    <asp:BoundColumn Visible="False" DataField="ID" HeaderText="ID"></asp:BoundColumn>
                                                                    <asp:TemplateColumn Visible="False">
                                                                        <HeaderStyle Width="3%"></HeaderStyle>
                                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton CausesValidation="False" ID="lnkNonEmesse" runat="server" CommandName="NonEmesse" ImageUrl="~/images/edit.gif" CommandArgument='<%# "EditCreazione.aspx?wr_id=" + DataBinder.Eval(Container.DataItem,"ID")%>'></asp:ImageButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn Visible="False" DataField="ID" HeaderText="N. RDL"></asp:BoundColumn>
                                                                    <asp:BoundColumn Visible="False" DataField="bl" HeaderText="EDIFICIO"></asp:BoundColumn>
                                                                    <asp:BoundColumn Visible="False" DataField="Data" HeaderText="DATA RICHIESTA" DataFormatString="{0:d}"></asp:BoundColumn>
                                                                    <asp:BoundColumn Visible="False" DataField="status" HeaderText="STATO"></asp:BoundColumn>
                                                                    <asp:BoundColumn Visible="False" DataField="Descrizione" HeaderText="DESCRIZIONE"></asp:BoundColumn>
                                                                    <asp:BoundColumn Visible="False" DataField="Richiedente" HeaderText="RICHIEDENTE"></asp:BoundColumn>
                                                                </Columns>
                                                                <PagerStyle Mode="NumericPages"></PagerStyle>
                                                            </asp:DataGrid></td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <iframe id="DivShim" style="display: none; position: absolute" src="javascript:false;" frameborder="0"
                                                scrolling="no"></iframe>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="4">
                                            <asp:LinkButton ID="LinkApprovate" runat="server" CssClass="LabelInfo" CausesValidation="False"
                                                Visible="False">Richieste Approvate</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="PanelEmesse" Style="display: none; z-index: 100; color: #ffffff; position: absolute; background-color: gainsboro"
                                                runat="server" Width="100%">
                                                <table height="100%" width="100%">
                                                    <tr>
                                                        <td class="TitleSearch" valign="top" align="right">
                                                            <asp:LinkButton ID="LinkChiudi2" runat="server" CausesValidation="False" CssClass="LabelChiudi">Chiudi</asp:LinkButton></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:DataGrid ID="DatagridEmesse" runat="server" CssClass="DataGrid" AllowPaging="True" GridLines="Vertical"
                                                                AutoGenerateColumns="False" BorderWidth="1px" BorderColor="Gray">
                                                                <AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
                                                                <ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
                                                                <HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
                                                                <Columns>
                                                                    <asp:BoundColumn Visible="False" DataField="ID" HeaderText="ID"></asp:BoundColumn>
                                                                    <asp:TemplateColumn Visible="False">
                                                                        <HeaderStyle Width="3%"></HeaderStyle>
                                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton CausesValidation="False" ID="lnlEmesse" runat="server" CommandName="Emesse" ImageUrl="~/images/edit.gif" CommandArgument='<%# "EditCreazione.aspx?wr_id=" + DataBinder.Eval(Container.DataItem,"ID") + "&c=true"%>'></asp:ImageButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn Visible="False" DataField="ID" HeaderText="N. RDL"></asp:BoundColumn>
                                                                    <asp:BoundColumn Visible="False" DataField="bl" HeaderText="EDIFICIO"></asp:BoundColumn>
                                                                    <asp:BoundColumn Visible="False" DataField="Data" HeaderText="DATA RICHIESTA" DataFormatString="{0:d}"></asp:BoundColumn>
                                                                    <asp:BoundColumn Visible="False" DataField="status" HeaderText="STATO"></asp:BoundColumn>
                                                                    <asp:BoundColumn Visible="False" DataField="Descrizione" HeaderText="DESCRIZIONE"></asp:BoundColumn>
                                                                    <asp:BoundColumn Visible="False" DataField="Richiedente" HeaderText="RICHIEDENTE"></asp:BoundColumn>
                                                                </Columns>
                                                                <PagerStyle Mode="NumericPages"></PagerStyle>
                                                            </asp:DataGrid></td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <iframe id="DivEmesse" style="display: none; position: absolute" src="javascript:false;"
                                                frameborder="0" scrolling="no"></iframe>
                                        </td>
                                    </tr>
                                    <tr width="100%">
                                        <td align="left" width="100%">
                                            <asp:Button ID="btsCodice" runat="server" Width="153" Height="22" Text="Visualizza Reperibilità"
                                                Visible="False"></asp:Button><br>
                                            <asp:TextBox ID="txtBL_ID" runat="server" Width="0px"></asp:TextBox>
                                            <div id="PopupRep" style="border-right: #000000 1px solid; border-top: #000000 1px solid; display: none; border-left: #000000 1px solid; width: 100%; border-bottom: #000000 1px solid; position: absolute; height: 200%">
                                                <iframe id="docRep" name="docRep" src="" frameborder="no" width="100%"></iframe>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="4">
                                            <asp:Panel ID="PanelServizio" runat="server">
                                                <table id="Table2" style="width: 100%" cellspacing="1" cellpadding="1" border="0">
                                                    <tr>
                                                        <td style="height: 16px" width="15%">Servizio</td>
                                                        <td style="height: 16px" colspan="5">
                                                            <cc1:S_ComboBox ID="cmbsServizio" runat="server" DBIndex="10" DBSize="4" DBParameterName="p_Servizio_Id"
                                                                Width="350px" DBDataType="Integer" AutoPostBack="True">
                                                            </cc1:S_ComboBox></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"><span>Std. Apparecchiatura</span></td>
                                                        <td colspan="5">
                                                            <cc1:S_ComboBox ID="cmbsApparecchiatura" runat="server" DBIndex="11" DBSize="4" DBParameterName="p_Eqstd_Id"
                                                                Width="350px" AutoPostBack="True">
                                                            </cc1:S_ComboBox></td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="4">
                                            <table id="TableRicercaApparecchiatura" style="width: 100%" cellspacing="1" cellpadding="1"
                                                border="0">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <uc1:CodiceApparecchiature ID="CodiceApparecchiature1" runat="server"></uc1:CodiceApparecchiature>
                                                        </td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                <asp:Panel ID="PanelProblema" runat="server">
                                    <table id="TableProblema" style="width: 100%" cellspacing="1" cellpadding="1" border="0">
                                        <tr>
                                            <td width="15%">Urgenza</td>
                                            <td colspan="3">
                                                <cc1:S_ComboBox ID="cmbsUrgenza" runat="server" DBIndex="12" DBSize="4" DBParameterName="p_Priority"
                                                    Width="200px" DBDataType="Integer">
                                                </cc1:S_ComboBox></td>
                                        </tr>
                                        <tr>
                                            <td>Descrizione Problema<br>
                                                Note</td>
                                            <td colspan="3">
                                                <cc1:S_TextBox ID="txtsProblema" runat="server" DBIndex="13" DBSize="4000" DBParameterName="p_Description"
                                                    Rows="4" TextMode="MultiLine" Width="100%"></cc1:S_TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td width="30%">
                                                <asp:CheckBox ID="chksSendMail" runat="server" Text="[Si/No]"></asp:CheckBox>
                                            <td width="15%">Destinatari
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtsMittente" runat="server" Width="100%" ToolTip="Gli indirizzi mail devono essere separati da ;"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>Data Richiesta
													<asp:RequiredFieldValidator ID="rfvDataRichiesta" runat="server" ErrorMessage="Indicare la Data di Richiesta"
                                                        ControlToValidate="txtsDataRichiesta">*</asp:RequiredFieldValidator></td>
                                            <td>
                                                <cc1:S_TextBox ID="txtsDataRichiesta" runat="server" MaxLength="10" DBIndex="14" DBSize="10" DBParameterName="p_Date_Requested"
                                                    ReadOnly="True"></cc1:S_TextBox></td>
                                            <td>Ora
													<asp:RequiredFieldValidator ID="rfvOraRichiesta" runat="server" ErrorMessage="Indicare l'Ora di Richiesta" ControlToValidate="txtsOraRichiesta">*</asp:RequiredFieldValidator></td>
                                            <td>
                                                <cc1:S_TextBox ID="txtsOraRichiesta" runat="server" MaxLength="5" DBIndex="15" DBSize="5" DBParameterName="p_Time_Requested"
                                                    Width="50px" ReadOnly="True"></cc1:S_TextBox></td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 5%" valign="top" align="left"></td>
                <td style="height: 5%" valign="top" align="left">
                    <cc1:S_Button ID="btnsSalva" TabIndex="2" runat="server" Text="Salva"></cc1:S_Button>&nbsp;<asp:Button ID="cmdReset" CausesValidation="False" Text="Reset" runat="server" Visible="False"></asp:Button>
                    <cc1:S_Button ID="btnsChiudi" runat="server" Text="Chiudi"></cc1:S_Button></td>
            </tr>
            <tr>
                <td style="height: 1%" valign="top" align="left"></td>
                <td style="height: 1%" valign="top" align="left">
                </td>
            </tr>
            <tr>
                <td style="height: 5%" valign="top" align="left"></td>
                <td style="height: 5%" valign="top" align="left">
                    <asp:Label ID="lblFirstAndLast" runat="server"></asp:Label>&nbsp;
						<MessPanel:MessagePanel ID="PanelMess" runat="server" MessageIconUrl="~/Images/ico_info.gif" ErrorIconUrl="~/Images/ico_critical.gif"></MessPanel:MessagePanel>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="vlsEdit" runat="server" ShowSummary="False" DisplayMode="List" ShowMessageBox="True"></asp:ValidationSummary>
        
    </form>
    <script language="javascript">parent.left.calcola();</script>
</body>
</html>
