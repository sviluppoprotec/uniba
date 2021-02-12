<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>

<%@ Page Language="c#" CodeBehind="ChangePassword.aspx.cs" AutoEventWireup="false" Inherits="TheSite.CommonPage.ChangePassword" %>

<%@ Register TagPrefix="cc2" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>ChangePassword</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
    <script language="javascript">
        function nascondi() {
            var ctrl = document.getElementById('<%=PanelMess.ClientID%>');
            if (ctrl != null) {
                ctrl.style.visibility = "hidden";
                ctrl.style.display = "none";
            }
        }
    </script>
</head>
<body ms_positioning="GridLayout">
    <form id="Form1" method="post" runat="server">
        <uc1:PageTitle ID="PageTitle1" runat="server"></uc1:PageTitle>
        <table height="100%" cellspacing="0" cellpadding="0" align="center" border="0">
            <tr>
                <td style="height: 0.24%">&nbsp;</td>
            </tr>
            <tr>
                <td valign="middle">
                    <div align="center">
                        <asp:RequiredFieldValidator ID="rfvconferma" runat="server" CssClass="LabelErrore" ControlToValidate="txtsConfermaPasword"
                            ErrorMessage="Inserire la password corrente" Display="None"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvnuovapawd" runat="server" ErrorMessage="Inserire la conferma della nuova password"
                            ControlToValidate="txtsNewPasword" CssClass="LabelErrore" Display="None"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="La nuova password deve essere uguale a quella di conferma."
                            ControlToValidate="txtsConfermaPasword" Display="None" ControlToCompare="txtsNewPasword"></asp:CompareValidator>
                        <!--Password Complessa-->
                        <asp:RegularExpressionValidator ID="regexpValidator" runat="server" ErrorMessage="La nuova password deve essere lunga 8 caratteri e contenere una maiuscola e un numero"
                            ControlToValidate="txtsConfermaPasword" Display="None" ControlToCompare="txtsNewPasword" ValidationExpression="^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\d\W])|(?=.*\W)(?=.*\d))|(?=.*\W)(?=.*[A-Z])(?=.*\d)).{8,}$"></asp:RegularExpressionValidator>
                        <!--Fine password complessa-->

                        <table style="border-right: slategray 1px outset; border-top: slategray 1px outset; border-left: slategray 1px outset; width: 346px; border-bottom: slategray 1px outset; height: 311px"
                            cellspacing="1" cellpadding="2" align="center" bgcolor="gainsboro" border="0">
                            <tr>
                                <td style="height: 35px" valign="middle" colspan="2" class="TitleSearch" align="center">
                                    <b>Usa questo modulo per cambiare la tua Password. </b>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 130px; height: 24px" valign="middle"></td>
                                <td style="height: 24px"></td>
                            </tr>
                            <tr>
                                <td style="height: 1px" valign="middle" align="right"><span class="TestoNormale">PASSWORD 
											CORRENTE:</span></td>
                                <td style="height: 1px">
                                    <cc1:S_TextBox ID="txtsPasword" runat="server" DBDirection="Input" DBSize="0" Width="170px" TextMode="Password"></cc1:S_TextBox></td>
                            </tr>
                            <tr>
                                <td style="height: 13px" valign="middle" align="right"><span class="TestoNormale">NUOVA 
											PASSWORD:</span></td>
                                <td style="height: 13px">
                                    <cc1:S_TextBox ID="txtsNewPasword" runat="server" DBDirection="Input" DBSize="0" Width="170px"
                                        DBIndex="1" TextMode="Password"></cc1:S_TextBox></td>
                            </tr>
                            <tr>
                                <td style="height: 13px" valign="middle" align="right">CONFERMA PASSWORD:</td>
                                <td style="height: 13px">
                                    <cc1:S_TextBox ID="txtsConfermaPasword" runat="server" Width="170px" DBSize="0" DBDirection="Input"
                                        TextMode="Password" DBIndex="1"></cc1:S_TextBox></td>
                            </tr>
                            <tr>
                                <td style="height: 43px" colspan="2" align="center">
                                    <asp:Button ID="BttConferma" runat="server" Text="Cambia Password" CssClass="btn"></asp:Button></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <p align="center">
                                        <cc2:MessagePanel ID="PanelMess" runat="server" MessageIconUrl="~/Images/ico_info.gif" ErrorIconUrl="~/Images/ico_critical.gif"
                                            HorizontalAlign="Center" Wrap="False">
                                        </cc2:MessagePanel>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="301px"></asp:ValidationSummary>
                                    </p>
                                </td>
                            </tr>
                        </table>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" CssClass="LabelErrore" ControlToValidate="txtsPasword"
                            ErrorMessage="Inserire la nuova password" Display="None"></asp:RequiredFieldValidator><a
                                class="GuidaLink" href="<%= HelpLink %>" target="_blank">Guida</a>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="middle" align="right"><a class="GuidaLink" href="<%= HelpLink %>"
                    target="_blank"></a></td>
            </tr>
            <tr>
                <td valign="middle" align="right"></td>
            </tr>
        </table>
    </form>
</body>
</html>
