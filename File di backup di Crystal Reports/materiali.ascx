<%@ Register TagPrefix="uc1" TagName="UserMateriali" Src="UserMateriali.ascx" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="materiali.ascx.cs" Inherits="TheSite.WebControls.materiali" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="MessPanel" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<SCRIPT language="javascript">
	function cmbSelezione(cmbMateriali,txtPrezzoUnitario,txtUnita,txtQuantita,txtPrezzoTotale)
	{
		var valueCmb;
		var valueArray;
		valueCmb =	document.getElementById(cmbMateriali).value;
		valueArray = valueCmb.split(";");
		document.getElementById(txtQuantita).value = '';
		document.getElementById(txtPrezzoTotale).value = '';
		document.getElementById(txtPrezzoUnitario).value = valueArray[1];
		document.getElementById(txtUnita).value = valueArray[2];
		if(document.getElementById(txtQuantita).value.length == 0)
		{   
			document.getElementById(txtPrezzoTotale).value = 0;
		}
	}
	function calcolaPrezzoTotale(txtPrezzoUnitario,txtQuantita,txtPrezzoTotale)
	{
		var quantita;
		var prezzoUnitario;
		var quantitaTotale;
		var fPrezzoUnitario;
		var PrezzoTotaleApprossimato;
		var prezzoTotale;
		var arrayPrezzoUnitario,arrayPrezzoTotale;

		quantita = document.getElementById(txtQuantita).value;
		prezzoUnitario = document.getElementById(txtPrezzoUnitario).value;
		fPrezzoUnitario = NumVirgolaToPunto(prezzoUnitario);
		prezzoTotale = parseFloat(quantita) * parseFloat(fPrezzoUnitario);
		PrezzoTotaleApprossimato = formatta(prezzoTotale);
		document.getElementById(txtPrezzoTotale).value = NumPuntoToVirgola(PrezzoTotaleApprossimato);
		if(document.getElementById(txtQuantita).value.length == 0)
		{   
			document.getElementById(txtPrezzoTotale).value = 0;
		}
	
	}

function NumVirgolaToPunto(numV)
{
	var ar,numP,numS,inde,i;
	numS = numV.toString();
	i = parseInt(numS.indexOf(","));	
	if(i> 0)
	{
		ar = numS.split(",");
		numP = ar[0] + "." + ar[1];
		return numP;
	}
	else
	{
		return numS;
	}
}

function NumPuntoToVirgola(numP)
{
	var ar,numV,numS,i;
	numS = numP.toString();
	i = parseInt(numS.indexOf("."));
	if(i > 0)
	{
		ar = numS.split(".");
		numV = ar[0] + "," + ar[1];
		return numV;
	}
	else
	{
		return numS;
	}
}
function formatta(fl){	
	var ris;
	var tmp;
	fl=fl.toString();	
	i = parseInt(fl.indexOf("."));		
	if(i>0)
	{			
		lung = parseInt(fl.substring(i+1).length);			
		if(lung>2)
		{
			terza = fl.substring(i+3,i+4);
			ris = parseFloat(fl.substring(0,i+3));					
			if (terza>4)
			{
				ris = ris + parseFloat(0.01);
				ris=ris.toString();
				j=parseInt(ris.indexOf("."));
				tmp = parseFloat(ris.substring(0,j+3));				
				return tmp;
			}
			else
			{
				return ris;
			}
					
		}	
		ris = parseFloat(fl.substring(0,i+3));
		return ris;		
	}
	
	return fl;	
}
function ControllaCaratteri(){
	if (event.keyCode < 48	|| event.keyCode > 57){
		event.keyCode = 0;
	}	
}

function Segnalibro()
{
	location.href='#segnalibro';

}
</SCRIPT>
<TABLE id="TableMain" cellspacing="0" cellpadding="0" align="left" border="0" width="100%">
	<TR>
		<TD vAlign="top" align="center" height="95%"><A name="segnalibro"></A>
			<TABLE id="tblFormInput" cellspacing="1" cellpadding="1" align="center">
				<TR>
					<TD style="HEIGHT: 5%" valign="top" align="left"></TD>
					<TD style="HEIGHT: 5%" valign="top" align="left">
						<TABLE id="tblGridTitle" cellspacing="1" cellpadding="1" border="0">
							<TR>
								<TD width="20%"><ASP:LINKBUTTON id="lkbNuovo" cssclass="NuovoLink" runat="server">Nuovo</ASP:LINKBUTTON></TD>
								<TD width="60%"></TD>
								<TD align="right" width="20%">Record:
									<ASP:LABEL id="lblRecord" runat="server">0</ASP:LABEL>&nbsp;&nbsp;&nbsp;</TD>
							</TR>
						</TABLE>
						<ASP:DATAGRID id="DataGridEsegui" cssclass="DataGrid" runat="server" autogeneratecolumns="False"
							gridlines="Vertical" borderwidth="1px" bordercolor="Gray" datakeyfield="ID">
							<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
							<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
							<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
							<Columns>
								<asp:BoundColumn Visible="False" DataField="ID" HeaderText="ID"></asp:BoundColumn>
								<asp:TemplateColumn>
									<HeaderStyle Width="5%"></HeaderStyle>
									<ItemStyle Wrap="False" Height="20px"></ItemStyle>
									<ItemTemplate>
										<ASP:IMAGEBUTTON id="imbEdit" runat="server" height="20px" imageurl="../Images/edit.gif" commandname="Edit"></ASP:IMAGEBUTTON>
										<ASP:IMAGEBUTTON id="imbDelete" runat="server" height="20px" imageurl="../Images/elimina.gif" commandname="Delete"></ASP:IMAGEBUTTON>
									</ItemTemplate>
									<FooterStyle Wrap="False" Height="20px" Width="5%"></FooterStyle>
									<FooterTemplate>
										<ASP:IMAGEBUTTON id="imbInsert" runat="server" Visible="False" height="20px" imageurl="../Images/salva.gif"
											commandname="Insert"></ASP:IMAGEBUTTON>
										<ASP:IMAGEBUTTON id="imgCancel" runat="server" Visible="False" height="20px" imageurl="../Images/annulla.gif"
											commandname="Cancel"></ASP:IMAGEBUTTON>
									</FooterTemplate>
									<EditItemTemplate>
										<ASP:IMAGEBUTTON id="imbUpdate" runat="server" Visible="False" height="20px" imageurl="../Images/salva.gif"
											commandname="Update"></ASP:IMAGEBUTTON>
										<ASP:IMAGEBUTTON id="imbCancel" runat="server" Visible="False" height="20px" imageurl="../Images/annulla.gif"
											commandname="Cancel"></ASP:IMAGEBUTTON>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Materiale">
									<HeaderStyle HorizontalAlign="Center" Width="18%"></HeaderStyle>
									<ItemStyle HorizontalAlign="Left" Height="20px"></ItemStyle>
									<ItemTemplate>
										<ASP:LABEL id=lblDescrizione runat="server" text='<%# DataBinder.Eval(Container.DataItem, "materiale") %>' Height="20px">
										</ASP:LABEL>
									</ItemTemplate>
									<FooterStyle HorizontalAlign="Left" Width="18%"></FooterStyle>
									<FooterTemplate>
										<ASP:DROPDOWNLIST id=cmbMaterialiInsert runat="server" Height="20px" datavaluefield="cmbvalore" datatextfield="materiale" datasource="<%#GetMateriali()%>" Visible="False">
										</ASP:DROPDOWNLIST>
										<uc1:UserMateriali id="UserMateriali1In" runat="server"></uc1:UserMateriali>
									</FooterTemplate>
									<EditItemTemplate>
										<ASP:DROPDOWNLIST id=cmbMaterialiEdit runat="server" Height="20px" datavaluefield="cmbvalore" datatextfield="materiale" selectedindex='<%# GetIndex(DataBinder.Eval(Container.DataItem, "materiale").ToString()) %>' datasource="<%#GetMateriali()%>" Visible="False">
										</ASP:DROPDOWNLIST>
										<uc1:UserMateriali id="UserMateriali1" runat="server"></uc1:UserMateriali>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Unit&#224;">
									<HeaderStyle HorizontalAlign="Center" Width="18%"></HeaderStyle>
									<ItemStyle HorizontalAlign="Left" Width="18%"></ItemStyle>
									<ItemTemplate>
										<ASP:LABEL id="lblunita" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "unitamisura") %>'>
										</ASP:LABEL>
									</ItemTemplate>
									<FooterStyle HorizontalAlign="Left" Width="18%"></FooterStyle>
									<FooterTemplate>
										<ASP:TEXTBOX id="txtunitaInsert" runat="server" width="100%" visible="True" readonly="True" borderwidth="0"></ASP:TEXTBOX>
									</FooterTemplate>
									<EditItemTemplate>
										<ASP:TEXTBOX id="txtunitaEdit" runat="server" width="100%" text='<%# DataBinder.Eval(Container.DataItem, "unitamisura") %>' visible="True" ReadOnly="True" BorderWidth="0">
										</ASP:TEXTBOX>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Prezzo Unitario (�)">
									<HeaderStyle HorizontalAlign="Center" Width="18%"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right" Width="18%"></ItemStyle>
									<ItemTemplate>
										<ASP:LABEL id="lblprezzo" style="TEXT-ALIGN: right" runat="server" text='<%# FormattaDecimali(DataBinder.Eval(Container.DataItem, "prezzo_unitario"),2) %>'>
										</ASP:LABEL>
									</ItemTemplate>
									<FooterStyle HorizontalAlign="Right" Width="18%"></FooterStyle>
									<FooterTemplate>
										<ASP:TEXTBOX id="txtprezzoInsert" style="TEXT-ALIGN: right" width="100%" runat="server" visible="True"
											readonly="True" borderwidth="0"></ASP:TEXTBOX>
									</FooterTemplate>
									<EditItemTemplate>
										<ASP:TEXTBOX id="txtprezzoEdit" style="TEXT-ALIGN: right" width="100%" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "prezzo_unitario") %>' visible="True" ReadOnly="True" BorderWidth="0">
										</ASP:TEXTBOX>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Quantit&#224;">
									<HeaderStyle HorizontalAlign="Center" Width="13%"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
									<ItemTemplate>
										<ASP:LABEL id="lblquantita" style="TEXT-ALIGN: right" runat="server" text='<%# FormattaDecimali(DataBinder.Eval(Container.DataItem, "quantita"),0) %>' width="100%">
										</ASP:LABEL>
									</ItemTemplate>
									<FooterStyle HorizontalAlign="Right" Width="13%"></FooterStyle>
									<FooterTemplate>
										<ASP:TEXTBOX id="txtquantitaInset" style="TEXT-ALIGN: right" runat="server" text="0" visible="True"
											enabled="true" width="100%"></ASP:TEXTBOX>
									</FooterTemplate>
									<EditItemTemplate>
										<ASP:TEXTBOX id="txtquantitaEdit" style="TEXT-ALIGN: right" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "quantita") %>' visible="True" enabled="true">
										</ASP:TEXTBOX>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Totale (�)">
									<HeaderStyle HorizontalAlign="Center" Width="12%"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right" Width="12%"></ItemStyle>
									<ItemTemplate>
										<ASP:LABEL id="lbltotale" style="TEXT-ALIGN: right " width="100%" runat="server" text='<%# FormattaDecimali(DataBinder.Eval(Container.DataItem, "prezzototale"),2) %>'>
										</ASP:LABEL>
									</ItemTemplate>
									<FooterStyle HorizontalAlign="Right"></FooterStyle>
									<FooterTemplate>
										<ASP:TEXTBOX id="txttotaleInsert" style="TEXT-ALIGN: right" runat="server" readonly="True" enabled="true"
											visible="True" width="100%">0</ASP:TEXTBOX>
									</FooterTemplate>
									<EditItemTemplate>
										<ASP:TEXTBOX id="txttotaleEdit" style="TEXT-ALIGN: right" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "prezzototale") %>' readonly="True" enabled="true" visible="True">
										</ASP:TEXTBOX>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="Totale_Progressivo" ReadOnly="True" HeaderText="Totale Progressivo (�)">
									<HeaderStyle HorizontalAlign="Center" Width="18%"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right" Height="20px" Width="18%"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
						</ASP:DATAGRID></TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>
<asp:Label id="lblTot" runat="server" Width="0px" Height="0px"></asp:Label>
