<%@ Control Language="c#" AutoEventWireup="false" Codebehind="RicercaModulo.ascx.cs" Inherits="TheSite.WebControls.RicercaModulo" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<!---<LINK href="../Css/IACPSheet.css" type="text/css" rel="stylesheet">-->
<script language="javascript">
/*function Verifica(sender)
{
	if(sender.length != 6) return true;
}
*/
</script>
<TABLE runat="server" id="tblModulo" cellSpacing="1" cellPadding="1" width="100%" border="0"
	class="tblSearch100Dettaglio">
	<TR>
		<TD style="WIDTH: 15%"><B>Cod. Edificio</B></TD>
		<TD noWrap><cc1:s_textbox id="txtsCodEdificio" Width="63px" runat="server"></cc1:s_textbox><INPUT id="btsCodice" style="WIDTH: 32px; HEIGHT: 22px" type="button" value="..." title="Ricerca il Codice dell'Edificio" onclick="ShowFrame('<%=idTextCod%>','idcod',event,'<%=idModulo%>','<%=multisele%>');"class=btn>&nbsp;
			<asp:Label id="lblBlId" runat="server" Visible="False"></asp:Label>
			<input type="hidden" id="hiddenidbl" runat="server" style="WIDTH: 16px; HEIGHT: 25px" size="1">
		</TD>
		<TD align="center"><INPUT id="btnsRicerca" title="Fare Click per effettuare la Ricerca Edificio" type="button"
				value="Ricerca Edificio"  onclick="ShowFrame('<%=idTextRic%>','idric',event,'<%=idModulo%>','<%=multisele%>');"class=btn></TD>
		<TD>
			<cc1:S_TextBox id="txtRicerca" runat="server" Width="420px"></cc1:S_TextBox></TD>
	</TR>
	<TR>
		<TD style="WIDTH: 15%" colSpan="4">
			<asp:Panel id="PanelDettagli" runat="server">
				<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
					<TR>
						<TD>Denominazione</TD>
						<TD>
							<asp:Label id="lblDenominazione" runat="server" CssClass="LabelReadOnly"></asp:Label></TD>
						<TD>Indirizzo</TD>
						<TD>
							<asp:Label id="lblIndirizzo" runat="server" CssClass="LabelReadOnly"></asp:Label></TD>
					</TR>
					<TR>
						<TD>Comune</TD>
						<TD>
							<asp:Label id="lblComune" runat="server" CssClass="LabelReadOnly"></asp:Label></TD>
						<TD style="DISPALY:NONE">Telefono</TD>
						<TD style="DISPALY:NONE">
							<asp:Label id="lblTelefono" runat="server" CssClass="LabelReadOnly"></asp:Label></TD>
					</TR>
					<TR style="DISPALY:NONE">
						<TD>Ditta</TD>
						<TD>
							<asp:Label id="lblDitta" runat="server" CssClass="LabelReadOnly"></asp:Label></TD>
						<TD>Centro di Costo</TD>
						<TD>
							<asp:Label id="lblCdC" runat="server" CssClass="LabelReadOnly"></asp:Label></TD>
					</TR>
					<TR>
						<TD><INPUT id="lblEmail" style="WIDTH: 16px; HEIGHT: 25px" type="hidden" size="1" name="Hidden1"
								runat="server"></TD>
						<TD colSpan="3"></TD>
					</TR>
				</TABLE>
			</asp:Panel></TD>
	</TR>
</TABLE>
<div id="Popup" style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; DISPLAY: none; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; POSITION: absolute"><iframe id="doc" style="HEIGHT: 450px" name="doc" src="" frameBorder="no" width="100%" scrolling="auto">
	</iframe>
</div>
