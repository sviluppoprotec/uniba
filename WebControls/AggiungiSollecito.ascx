<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="AggiungiSollecito.ascx.cs" Inherits="TheSite.WebControls.AggiungiSollecito" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<input id="btsCodice" title="Aggiungi un sollecito alla RDL" style="width: 136px; height: 22px"
    type="button" value="Aggiungi Sollecito" runat="server">
<asp:TextBox ID="txtWR_ID" runat="server" Width="0px" Style="display: none"></asp:TextBox>
<div id="PopupAddSoll" style="border-right: #000000 1px solid; border-top: #000000 1px solid; display: none; border-left: #000000 1px solid; width: 850px; border-bottom: #000000 1px solid; position: absolute; height: 150px">
    <iframe id="docAddSoll" name="docAddSoll" src="" frameborder="no" style="width: 850px; height: 250px"></iframe>
</div>
