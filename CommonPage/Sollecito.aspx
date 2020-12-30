<%@ Page Language="c#" CodeBehind="Sollecito.aspx.cs" AutoEventWireup="false" Inherits="TheSite.CommonPage.Sollecito" %>

<%@ Register TagPrefix="uc1" TagName="RichiedentiSollecito" Src="../WebControls/RichiedentiSollecito.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="Richiedenti" Src="../WebControls/Richiedenti.ascx" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>ListaMatricole</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
    <script language="javascript">
        var NS4 = (navigator.appName == "Netscape" && parseInt(navigator.appVersion) < 5);
        var NSX = (navigator.appName == "Netscape");
        var IE4 = (document.all) ? true : false;

        function Chiudi() {
            var oVDiv = parent.document.getElementById("PopupAddSoll").style;
            oVDiv.display = 'none';
        }
        /*	function seleziona(sender)
            {
             parent.document.getElementById(idmodulo + "_" + "txtfascicolo").value=sender;
             Chiudi();
            }
        */
        function ControllaRichiedente(nome, cognome) {
            if (document.getElementById(nome).value == "" || document.getElementById(cognome).value == "") {
                alert('Inserire il dati del Richiedente');
                return false;
            }
            return true;
        }

    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <table id="Table1" style="z-index: 101; left: 8px; position: absolute; top: 8px"
            cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td class="TDCommon">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="javascript:Chiudi()" Height="16px" Width="56px"><img border="0" src="../Images/chiudi.gif" /></asp:HyperLink></td>
            </tr>
            <tr>
                <td>
                    <p>&nbsp;</p>
                    <p>
                        <table id="tblSearch100" border="0">
                            <tr>
                                <td>
                                    <asp:Panel ID="PanelEdit"
                                        runat="server" Height="100px" Width="100%">
                                        <table width="100%">
                                            <tr>
                                                <td colspan="2">
                                                    <uc1:RichiedentiSollecito ID="RichiedentiSollecito1" runat="server"></uc1:RichiedentiSollecito>
                                                </td>
                                                <tr>
                                                    <td align="left">Motivazione</td>
                                                    <td>
                                                        <cc1:S_TextBox ID="txtsMotivo" runat="server" Width="270px" DBSize="4000" DBDirection="Input" DBParameterName="p_Motivo" DBIndex="3"></cc1:S_TextBox></td>
                                                </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">&nbsp;
                                    <cc1:S_Button ID="btnsAggiungi" TabIndex="4" runat="server" Text="Aggiungi"></cc1:S_Button></td>
                            </tr>
                        </table>
                    </p>
                </td>
            </tr>
            <tr>
                <td class="TDCommon">
                    <asp:HyperLink ID="Hyperlink2" runat="server" NavigateUrl="javascript:Chiudi()" Height="16px" Width="56px"><img border="0" src="../Images/chiudi.gif" /></asp:HyperLink></td>
            </tr>
        </table>
    </form>
</body>
</html>
