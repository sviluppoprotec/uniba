<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CalendarPicker.ascx.cs" Inherits="TheSite.WebControls.CalendarPicker" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<TABLE id="tbl_control" cellSpacing="0" cellPadding="0" border="0">
	<TR>
		<TD align="right"><asp:label id="lbl_Date" Font-Bold="true" runat="server"></asp:label></TD>
		<TD align="center"><cc1:s_textbox id="S_TxtDatecalendar" runat="server" Width="100px"></cc1:s_textbox></TD>
		<TD><INPUT id="btCalendar" title="Visualizza il Calendario" style="WIDTH: 24px; HEIGHT: 24px"
				type="button" value="..." name="btCalendar" runat="server" class=btn></TD>
	</TR>
</TABLE>
