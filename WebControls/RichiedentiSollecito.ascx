<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="RichiedentiSollecito.ascx.cs" Inherits="TheSite.WebControls.RichiedentiSollecito" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<script language="javascript">

    function ControllaId(nome) {
        if (document.getElementById(nome).value == "0") {
            alert('Nessun contatto per il richiedente selezionato.');
            return false;
        }
        return true;
    }

    function PulisciCampi() {
        document.getElementById('<%=idtxtRichNome%>').value = "";
        document.getElementById('<%=idtxtRichCognome%>').value = "";
        document.getElementById('<%=idtxtRichID%>').value = "0";
        document.getElementById('<%=idtxtRichGruppo%>').selectedIndex = "0";
        document.getElementById('<%=txtstelefono.ClientID%>').value = "0";
        document.getElementById('<%=txtsemail.ClientID%>').value = "0";
        document.getElementById('<%=txtstanza.ClientID%>').value = "0";
        /*document.getElementById("tdcontatti").style.display="none"*/
    }

    function SvuotaID() {
        //alert (event.keyCode);
        if (event.keyCode != 8 && event.keyCode != 9 && !(event.keyCode >= 16 && event.keyCode <= 20)
            && event.keyCode != 27 && !(event.keyCode >= 33 && event.keyCode <= 40)
            && !(event.keyCode >= 112 && event.keyCode <= 123)
            && event.keyCode != 144 && event.keyCode != 145) {
            var ctrl = document.getElementById('<%=idtxtRichID%>');
            ctrl.value = "0";
        }
    }

    function SvuotaIDCmb() {
        var ctrl = document.getElementById('<%=idtxtRichID%>');
        ctrl.value = "0";
    }

    function Controlla() {
        var id = document.getElementById('<%=idtxtRichID%>').value;
		/*if(id=='0')
			document.getElementById("tdcontatti").style.display="none"		 
		else
			document.getElementById("tdcontatti").style.display="block"*/

    }

    function TextRichiedente(nome, cognome, id, idGruppo, telefono, email, stanza) {
        var ctrl = document.getElementById('<%=idtxtRichNome%>');
        var ctrl2 = document.getElementById('<%=idtxtRichCognome%>');
        var ctrl3 = document.getElementById('<%=idtxtRichID%>');
        var ctrl4 = document.getElementById('<%=idtxtRichGruppo%>');

        var ctrl5 = document.getElementById('<%=txtstelefono.ClientID%>')
        var ctrl6 = document.getElementById('<%=txtsemail.ClientID%>')
        var ctrl7 = document.getElementById('<%=txtstanza.ClientID%>')

        ctrl.value = nome.replace("`", "'");
        ctrl2.value = cognome.replace("`", "'");
        ctrl3.value = id;
        ctrl4.value = idGruppo;
        ctrl5.value = telefono.replace("`", "'");
        ctrl6.value = email.replace("`", "'");
        ctrl7.value = stanza.replace("`", "'");
        /*linkcontatti.innerText="Visualizza Contatti";
        linkcontatti.innerText += " (" + TotContatti + ")";
        if(TotContatti==0)		 
           document.getElementById("tdcontatti").style.display="none";		 		 
        else		 
           document.getElementById("tdcontatti").style.display="block";*/

        RichiedentiSetVisible(false, '<%=NomePannello%>')
    }

    function RichiedentiSetVisible(state, Pannello) {
        var DivRef = document.getElementById(Pannello);
        var IfrRef = document.getElementById('RichiedenteShim');
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
</script>
Richiedente:&nbsp;
<asp:Panel ID="Panel1" BorderColor="LightSteelBlue" BorderWidth="1px" Height="58px" runat="server"
    Width="100%">
    <cc1:S_TextBox ID="txtRichID" Width="0px" DBDataType="Integer" Height="0px" DBParameterName="p_ID_RICHIEDENTE"
        runat="server" MaxLength="50" style="display:none">0</cc1:S_TextBox>
    <table id="Table1" cellspacing="1" cellpadding="1" border="0">
        <tr>
            <td>Nome</td>
            <td>
                <cc1:S_TextBox ID="txtRichNome" Width="150px" DBParameterName="p_NomeCompleto" runat="server" MaxLength="32"
                    DBIndex="1" DBSize="32"></cc1:S_TextBox></td>
            <td>Cognome</td>
            <td>
                <cc1:S_TextBox ID="txtRichCognome" Width="150px" DBParameterName="p_CognomeCompleto" runat="server"
                    MaxLength="32" DBIndex="2" DBSize="32"></cc1:S_TextBox></td>
            <td>Gruppo
            </td>
            <td style="width: 171px">
                <cc1:S_ComboBox ID="cmbsGruppo" Width="196px" runat="server" DBDataType="Integer" DBParameterName="p_id_Gruppo"
                    DBIndex="3" AutoPostBack="False">
                </cc1:S_ComboBox></td>
            <td>
                <asp:Button ID="cmdRichiedente" Width="24" runat="server" Height="24" ToolTip="Seleziona Richiedente"
                    CssClass="btn" CausesValidation="False" Text="..."></asp:Button></td>
            <td>
                <img src="../images/elimina.gif" style="cursor: hand" title="Pulisci Campi" border="0" onclick="PulisciCampi()" />
            </td>
        </tr>

        <tr>

            <td>Telefono</td>
            <td>
                <cc1:S_TextBox ID="txtstelefono" Width="150px" DBParameterName="p_telefono" runat="server"
                    MaxLength="50" DBIndex="2" DBSize="50"></cc1:S_TextBox></td>
            <td>Email
            </td>
            <td>
                <cc1:S_TextBox ID="txtsemail" Width="250px" DBParameterName="p_email" runat="server"
                    MaxLength="50" DBIndex="2" DBSize="50"></cc1:S_TextBox></td>

            </TD>	
			<td>Stanza</td>
            <td colspan="2">
                <cc1:S_TextBox ID="txtstanza" Width="150px" DBParameterName="p_stanza" runat="server" MaxLength="50"
                    DBIndex="1" DBSize="50"></cc1:S_TextBox></td>

        </tr>
        <tr>
            <td colspan="7" id="tdcontatti" style="display: none">
                <asp:LinkButton ID="lnkVisContatti" Width="272px" runat="server" CausesValidation="False">Visualizza Contatti</asp:LinkButton></td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel ID="PanelContatti" Style="display: none; color: #ffffff; background-color: gainsboro"
    runat="server" Width="100%">
    <table id="Table2" height="100%" width="100%">
        <tr>
            <td class="TitleSearch" valign="top" align="right">
                <asp:LinkButton ID="Linkbutton1" runat="server" CssClass="LabelChiudi" CausesValidation="False">Chiudi</asp:LinkButton></td>
        </tr>
        <tr>
            <td>
                <asp:DataGrid ID="DataGridEsegui" runat="server" BorderColor="Gray" CssClass="DataGrid" AutoGenerateColumns="False"
                    DataKeyField="ID">
                    <HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
                    <ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
                    <HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
                    <Columns>
                        <asp:BoundColumn DataField="Descrizione" HeaderText="Descrizione"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Tipologia" HeaderText="Tipologia"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid></td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel ID="RichiedenteShowInfo" Style="display: none; z-index: 101; color: #ffffff; position: absolute; background-color: gainsboro"
    runat="server" Width="100%">
    <table height="100%" width="100%">
        <tr>
            <td class="TitleSearch" valign="top" align="right">
                <asp:LinkButton ID="lnkChiudi" runat="server" CssClass="LabelChiudi" CausesValidation="False">Chiudi</asp:LinkButton></td>
            <!--
				<span style="cursor:hand" id="Richiedenti1_lnkChiudi" class="LabelChiudi" onclick="javascript:document.getElementById('<%=RichiedenteShowInfo.ClientID%>').style.display='none';">
					Chiudi
				</span>				
				-->
        </tr>
        <tr>
            <td>
                <asp:DataGrid ID="DataGridRichiedente" runat="server" BorderWidth="1px" BorderColor="Gray" CssClass="DataGrid"
                    AutoGenerateColumns="False" AllowPaging="True" GridLines="Vertical">
                    <AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
                    <ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
                    <HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
                    <Columns>
                        <asp:TemplateColumn HeaderText="Richiedente">
                            <ItemTemplate>
                                <a href="#" onclick="TextRichiedente('<%# Apici(DataBinder.Eval(Container, "DataItem.RichNome")) %>','<%# Apici(DataBinder.Eval(Container, "DataItem.RichCognome")) %>','<%# DataBinder.Eval(Container, "DataItem.ID") %>','<%# DataBinder.Eval(Container, "DataItem.RichGruppo") %>','<%# DataBinder.Eval(Container, "DataItem.telefono") %>','<%# DataBinder.Eval(Container, "DataItem.email") %>','<%# DataBinder.Eval(Container, "DataItem.stanza") %>')">
                                    <%# DataBinder.Eval(Container, "DataItem.RichNome") %>
                                    <%# DataBinder.Eval(Container, "DataItem.RichCognome") %>
																											
                                </a>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="tipo_richiedente" HeaderText="Gruppo"></asp:BoundColumn>
                        <asp:BoundColumn DataField="telefono" HeaderText="Telefono"></asp:BoundColumn>
                        <asp:BoundColumn DataField="email" HeaderText="Email"></asp:BoundColumn>
                        <asp:BoundColumn DataField="stanza" HeaderText="Stanza"></asp:BoundColumn>
                    </Columns>
                    <PagerStyle HorizontalAlign="Left" CssClass="DataGridPagerStyle" Mode="NumericPages"></PagerStyle>
                </asp:DataGrid></td>
        </tr>
    </table>
</asp:Panel>
<iframe id="RichiedenteShim" style="display: none; z-index: 100; position: absolute" src="javascript:false;"
    frameborder="0" scrolling="no"></iframe>
