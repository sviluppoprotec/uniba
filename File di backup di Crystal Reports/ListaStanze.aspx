<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Page language="c#" Codebehind="ListaStanze.aspx.cs" AutoEventWireup="false" Inherits="TheSite.CommonPage.ListaStanze" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ListaStanze</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		function Chiudi()
		{
			var oVDiv=parent.document.getElementById("PopupAppst").style;
			oVDiv.display = 'none';
		}
			function Popolast(sender,codice)
		{
			parent.document.getElementById(idUsercontrol1 + "_" + "s_txtDescStanza").innerText=sender;
			parent.document.getElementById(idUsercontrol1 + "_" + "TxtIdStanza").innerText=codice;
			Chiudi();       
		}
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" width="100%"
				border="0">
				<TR>
					<TD class="TDCommon">
						<asp:hyperlink id="HyperLink1" runat="server" NavigateUrl="javascript:Chiudi()" Height="16px" Width="56px">
							<img border="0" src="../Images/chiudi.gif" /></asp:hyperlink></TD>
				</TR>
				<TR>
					<TD width="100%">
						<uc1:GridTitle id="GridTitle1" runat="server"></uc1:GridTitle>
						<asp:DataGrid id="MyDataGrid1" runat="server" Width="100%" BorderColor="Gray" BorderStyle="None"
							BorderWidth="1px" BackColor="White" CellPadding="4" AutoGenerateColumns="False" CssClass="DataGrid"
							AllowPaging="True" GridLines="Vertical" PageSize="5">
							<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
							<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
							<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
							<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
							<Columns>
								<asp:TemplateColumn>
									<HeaderStyle Width="30px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
									<ItemTemplate>
										<a href="" runat="server" id="hrefset"><img border="0" id="imgsele" src="../Images/edit.gif"></a>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="Stanza" HeaderText="Descrizione Stanza"></asp:BoundColumn>
								<asp:BoundColumn DataField="Piano" HeaderText="Piano"></asp:BoundColumn>
								<asp:BoundColumn DataField="Edificio" HeaderText="Edificio"></asp:BoundColumn>
								<asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Left" ForeColor="Black" BackColor="Silver" Mode="NumericPages"></PagerStyle>
						</asp:DataGrid>
					</TD>
				</TR>
				<TR>
					<TD class="TDCommon">
						<asp:hyperlink id="HyperLinkChiudi2" runat="server" NavigateUrl="javascript:Chiudi()" Height="16px"
							Width="56px">
							<img border="0" src="../Images/chiudi.gif" /></asp:hyperlink></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
