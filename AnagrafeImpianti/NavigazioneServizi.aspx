<%@ Page Language="c#" CodeBehind="NavigazioneServizi.aspx.cs" AutoEventWireup="false" Inherits="TheSite.AnagrafeImpianti.NavigazioneServizi" %>

<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls" %>
<%@ Register TagPrefix="cc2" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="RicercaModulo" Src="../WebControls/RicercaModulo.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>NavigazioneDocumenti</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../Css/MainSheet.css" type="text/css" rel="stylesheet">

    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        .Grid, .ChildGrid {
            border: 1px solid #ccc;
        }

            .Grid td, .Grid th {
                border: 1px solid #ccc;
            }

            .Grid th {
                background-color: #B8DBFD;
                color: #333;
                font-weight: bold;
            }

            .ChildGrid td, .ChildGrid th {
                border: 1px solid #ccc;
            }

            .ChildGrid th {
                background-color: #ccc;
                color: #333;
                font-weight: bold;
            }
    </style>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("body").on("click", "[src*=plus]", function () {
                $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
                $(this).attr("src", "images/minus.png");
            });
            $("body").on("click", "[src*=minus]", function () {
                $(this).attr("src", "images/plus.png");
                $(this).closest("tr").next().remove();
            });
        })

        function deleteitem(sender, e) {
            if (sender.selectedIndex != -1) {
                if ((event.keyCode == 46) && (window.confirm('Eliminare dalla ricerca l\'edificio selezionato?'))) {
                    if (sender.options.length != 0) {
                        var eledelete = sender.options[sender.selectedIndex].value;
                        var str = document.getElementById("edifici").value;
                        var arr = new Array();
                        arr = str.split(",");
                        var arr2 = new Array();
                        for (i = 0; i <= arr.length - 1; i++) {
                            if (arr[i] == eledelete) {
                                arr.splice(i, 1);
                            }
                        }

                        document.getElementById("edifici").value = arr.join(",");
                        sender.options[sender.selectedIndex] = null
                    }
                }
            }
        }
        function errorlist(sender) {
            var ctrl = document.getElementById(sender);

            if (ctrl.options.length == 0) {
                alert("Selezionare almeno un Edificio!");
                return false;
            } else {
                return true;
            }

        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <table id="TableMain" style="z-index: 101; left: 8px; position: absolute; top: 8px" cellspacing="0"
            cellpadding="0" width="100%" align="center" border="0">
            <tr>
                <td style="height: 50px" align="center">
                    <uc1:PageTitle ID="PageTitle1" runat="server"></uc1:PageTitle>
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <cc2:DataPanel ID="DataPanel1" runat="server" AllowTitleExpandCollapse="True" CollapseImageUrl="../Images/up.gif"
                        CssClass="DataPanel75" CollapseText="Espandi/Riduci" ExpandImageUrl="../Images/down.gif" ExpandText="Espandi "
                        TitleText="Ricerca " Collapsed="False" TitleStyle-CssClass="TitleSearch">
                        <table id="tblForm" cellspacing="1" cellpadding="1" align="center">
                            <tr>
                                <td valign="top" align="left">
                                    <cc1:S_Label ID="lblComuneDescrizione" runat="server" Visible="False">Comune selezionato: </cc1:S_Label>
                                    <cc1:S_Label ID="lblComune" runat="server"></cc1:S_Label>&nbsp;
										<cc1:S_Label ID="lblFrazioneDescrizione" runat="server" Visible="False">Frazione: </cc1:S_Label>
                                    <cc1:S_Label ID="lblFrazione" runat="server"></cc1:S_Label></td>
                            </tr>
                            <tr>
                                <td valign="top" align="center">
                                    <uc1:RicercaModulo ID="RicercaModulo1" runat="server"></uc1:RicercaModulo>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td align="center">
                                    <table class="tblSearch100Dettaglio" id="tabl" style="height: 95px" cellspacing="0" cellpadding="0"
                                        width="100%" border="0">
                                        <tr>
                                            <td style="width: 14.88%"><span>Servizio: </span>
                                            </td>
                                            <td style="height: 28px">
                                                <cc1:S_ComboBox ID="cmbsServizio" runat="server" AutoPostBack="True" Width="392px"></cc1:S_ComboBox></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 131px; height: 26px"><span>Std. Apparecchiatura:</span>
                                            </td>
                                            <td style="height: 26px">
                                                <cc1:S_ComboBox ID="cmbsApparecchiatura" runat="server" Width="392px"></cc1:S_ComboBox></td>
                                        </tr>
                                        <tr>
                                            <td style="height: 4px" align="center" colspan="2">&nbsp; Edifici Selezionati
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <cc1:S_ListBox ID="S_ListEdifici" runat="server" Width="100%" DBSize="100" DBDirection="Input"></cc1:S_ListBox>&nbsp;
													<input id="edifici" type="hidden" name="edifici" runat="server">
                                                <input id="edificidescription" type="hidden" name="edificidescription" runat="server">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="2">
                                                <table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0">
                                                    <tr>
                                                        <td style="width: 239px" align="right">
                                                            <cc1:S_Button ID="S_btMostra" runat="server" CssClass="btn" Width="134px" Text="Mostra Dettagli"
                                                                ToolTip="Avvia la ricerca"></cc1:S_Button>&nbsp;</td>
                                                        <td style="width: 398px">&nbsp;
																<cc1:S_Button ID="btReset" runat="server" CssClass="btn" Width="134px" Text="Reset" ToolTip="Rimposta i criteri di ricerca"
                                                                    CausesValidation="False"></cc1:S_Button>&nbsp;</td>
                                                        <td align="right">&nbsp;<a class="GuidaLink"
                                                            href="<%= HelpLink %>" target="_blank">Guida</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </cc2:DataPanel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel1" runat="server" Height="480px">
                        <table class="tblSearch100Dettaglio" id="Tabletreview" height="100%" cellspacing="1" cellpadding="1"
                            width="100%" border="0">
                            <tr style="min-height: 800px">
                                <td style="width: 10%" valign="top">


                                    <asp:Repeater ID="RepeaterEdificio" runat="server" OnItemDataBound="RepeaterEdificio_ItemDataBound">
                                        <HeaderTemplate>
                                            <table class="Grid" cellspacing="0" rules="all" border="1">
                                                <tr>
                                                    <th scope="col">&nbsp;
                                                    </th>
                                                    <th scope="col" style="width: 150px">Cod
                                                    </th>
                                                    <th scope="col" style="width: 150px">Edificio
                                                    </th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <img alt="" style="cursor: pointer" src="images/plus.png" />
                                                    <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                                                        <asp:Repeater ID="RepeaterServizi" runat="server">
                                                            <HeaderTemplate>
                                                                <table class="ChildGrid" cellspacing="0" rules="all" border="1">
                                                                    <tr>
                                                                        <th scope="col" style="width: 150px">Servizio
                                                                        </th>
                                                                    </tr>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td>
                                                                        <a href="ServiceDettail.aspx?bl_id=<%# Eval("BL_ID") %>&servizio_id=<%# Eval("ID") %>" target="doctrevew">
                                                                            <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("DESCRIZIONE") %>' /></a>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                </table>
                                                            </FooterTemplate>
                                                        </asp:Repeater>
                                                    </asp:Panel>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("BL_ID") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCity" runat="server" Text='<%# Eval("DENOMINAZIONE") %>' />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </td>
                                <td style="width: 90%" valign="top">
                                    <iframe class="fram" id="doctrevew" style="width: 100%; height: 100%" name="doctrevew" frameborder="no"
                                        width="100%" scrolling="auto" height="100%" runat="server"></iframe>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
    <script language="javascript">parent.left.calcola();</script>
</body>
</html>
