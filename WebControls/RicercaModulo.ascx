<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="RicercaModulo.ascx.cs" Inherits="TheSite.WebControls.RicercaModulo" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<!---<LINK href="../Css/IACPSheet.css" type="text/css" rel="stylesheet">-->
<script language="javascript">
    /*function Verifica(sender)
    {
        if(sender.length != 6) return true;
    }
    */
</script>
<table runat="server" id="tblModulo" cellspacing="1" cellpadding="1" width="100%" border="0"
    class="tblSearch100Dettaglio">
    <tr>
        <td style="width: 15%"><b>Cod. Edificio</b></td>
        <td nowrap>
            <cc1:S_TextBox ID="txtsCodEdificio" Width="63px" runat="server"></cc1:S_TextBox><input id="btsCodice" style="width: 32px; height: 22px" type="button" value="..." title="Ricerca il Codice dell'Edificio" onclick="ShowFrame('<%=idTextCod%>','idcod',event,'<%=idModulo%>','<%=multisele%>');" class="btn">&nbsp;
			<asp:Label ID="lblBlId" runat="server" Visible="False"></asp:Label>
            <input type="hidden" id="hiddenidbl" runat="server" style="width: 16px; height: 25px" size="1">
        </td>
        <td align="center">
            <input id="btnsRicerca" title="Fare Click per effettuare la Ricerca Edificio" type="button"
                value="Ricerca Edificio" onclick="ShowFrame('<%=idTextRic%>','idric',event,'<%=idModulo%>','<%=multisele%>');" class="btn"></td>
        <td>
            <cc1:S_TextBox ID="txtRicerca" runat="server" Width="420px"></cc1:S_TextBox></td>
    </tr>
    <tr>
        <td style="width: 15%" colspan="4">
            <asp:Panel ID="PanelDettagli" runat="server">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td>Denominazione</td>
                        <td>
                            <asp:Label ID="lblDenominazione" runat="server" CssClass="LabelReadOnly"></asp:Label></td>
                        <td>Indirizzo</td>
                        <td>
                            <asp:Label ID="lblIndirizzo" runat="server" CssClass="LabelReadOnly"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Comune</td>
                        <td>
                            <asp:Label ID="lblComune" runat="server" CssClass="LabelReadOnly"></asp:Label></td>
                        <td style="dispaly: NONE">Telefono</td>
                        <td style="dispaly: NONE">
                            <asp:Label ID="lblTelefono" runat="server" CssClass="LabelReadOnly"></asp:Label></td>
                    </tr>
                    <tr style="dispaly: NONE">
                        <td>Ditta</td>
                        <td>
                            <asp:Label ID="lblDitta" runat="server" CssClass="LabelReadOnly"></asp:Label></td>
                        <td>Centro di Costo</td>
                        <td>
                            <asp:Label ID="lblCdC" runat="server" CssClass="LabelReadOnly"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <input id="lblEmail" style="width: 16px; height: 25px" type="hidden" size="1" name="Hidden1"
                                runat="server"></td>
                        <td colspan="3"></td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table>
<div id="Popup" style="width:90%; border-right: #000000 1px solid; border-top: #000000 1px solid; display: none; border-left: #000000 1px solid; border-bottom: #000000 1px solid; position: absolute">
    <iframe id="doc" style="height: 450px" name="doc" src="" frameborder="no" width="100%" scrolling="auto"></iframe>
</div>
