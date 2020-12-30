<%@ Register TagPrefix="cc2" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="CalendarPicker.ascx" %>
<%@ Register TagPrefix="uc1" TagName="VisualizzaSolleciti" Src="VisualizzaSolleciti.ascx" %>
<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="UserRdlInail.ascx.cs" Inherits="TheSite.WebControls.UserRdlInail" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="uc1" TagName="AggiungiSollecito" Src="AggiungiSollecito.ascx" %>
<script language="javascript" src="../images/cal/popcalendar.js"></script>
<script language="javascript">

    var NS4 = (navigator.appName == "Netscape" && parseInt(navigator.appVersion) < 5);
    var NSX = (navigator.appName == "Netscape");
    var IE4 = (document.all) ? true : false;



    function valutanumeri(evt) {
        var e = evt ? evt : window.event;
        if (!e) return;
        var key = 0;

        if (IE4 == true) {
            if (e.keyCode < 48 || e.keyCode > 57) {
                e.keyCode = 0;
                return false;
            }
        }

        if (e.keycode) { key = e.keycode; } // for moz/fb, if keycode==0 use 'which' 
        if (typeof (e.which) != 'undefined') {
            key = e.which;
            if (key < 48 || key > 57) {
                return false;
            }

        }
    }


    function imposta_dec(obj) {
        val = document.getElementById(obj).value;
        if (val == "")
            document.getElementById(obj).value = "00";
        if (val.length == 1)
            document.getElementById(obj).value = val + "0";
    }

    function imposta_int(obj) {
        if (document.getElementById(obj).value == "")
            document.getElementById(obj).value = "0";
    }


    function AddHour(var_s, caselladitesto) {
        var hh = 0.0;
        var txt = document.getElementById(caselladitesto)

        if (txt.value < 0 || txt.value > 24) {
            txt.value = 0;
        }

        hh = txt.value / 1 + var_s;

        if (hh == "NaN") {
            hh = 0;
        }

        if (hh >= 24) {
            hh = 0;
        }

        if (hh < 0) {
            hh = 23;
        }

        var str = ((hh < "10") ? "0" : "") + hh;
        if (str == "NaN") {
            str = "00";
        }

        txt.value = str;
    }

    function AddMinute(var_s, caselladitesto) {
        var mm = 0.0;
        var txt = document.getElementById(caselladitesto)

        if (txt.value < 0 || txt.value >= 60) {
            txt.var_mm.value = 0;
        }

        mm = txt.value / 1 + var_s * 15;

        if (mm == "NaN") {
            mm = 0;
        }

        if (mm >= 60) {
            mm = 0;
        }

        if (mm < 0) {
            mm = 45;
        }

        var str = ((mm < "10") ? "0" : "") + mm;
        if (str == "NaN") {
            str = "00";
        }

        txt.value = str;
    }
    function SetWorkType(Stato) {
        //trconsuntivo1.ClientID

        var crtl;
        switch (Stato) {
            case "4": //Attività completata
                var combTipoMan = document.getElementById('<%=cmbsTipoManutenzione.ClientID%>');

                crtl = document.getElementById('<%=trsoddisfazione.ClientID%>').style;
                crtl.display = "block";
                crtl = document.getElementById('<%=trannotazione.ClientID%>').style;
                crtl.display = "block";
                if (combTipoMan.options[combTipoMan.selectedIndex].value == "3") {

                    crtl = document.getElementById('<%=trannocontab.ClientID%>').style;
                    crtl.display = "block";
                    crtl = document.getElementById('<%=trconsuntivo1.ClientID%>').style;
                    crtl.display = "block";
                    crtl = document.getElementById('<%=trconsuntivo2.ClientID%>').style;
                    crtl.display = "block";
                    crtl = document.getElementById('<%=trconsuntivo3.ClientID%>').style;
                    crtl.display = "block";
                }
                crtl = document.getElementById('<%=trnote.ClientID%>').style;
                crtl.display = "none";
                break;
            case "11": //Emessa ma sospesa per Inaccessibilità				
            case "12": //Emessa ma sospesa per approvviggiovamento				
            case "14": //Emessa ma sospesa dal committente			
            case "8": //Emessa ma sospesa 
            case "13": //Emessa ma in sospeso per intervento specialistico

                crtl = document.getElementById('<%=trnote.ClientID%>').style;
                crtl.display = "block";
                crtl = document.getElementById('<%=trconsuntivo1.ClientID%>').style;
                crtl.display = "none";
                crtl = document.getElementById('<%=trconsuntivo2.ClientID%>').style;
                crtl.display = "none";
                crtl = document.getElementById('<%=trconsuntivo3.ClientID%>').style;
                crtl.display = "none";
                crtl = document.getElementById('<%=trannocontab.ClientID%>').style;
                crtl.display = "none";
                crtl = document.getElementById('<%=trsoddisfazione.ClientID%>').style
                crtl.display = "none";
                crtl = document.getElementById('<%=trannotazione.ClientID%>').style;
                crtl.display = "none";
                break;
            default:

                crtl = document.getElementById('<%=trnote.ClientID%>').style;
                crtl.display = "none";
                document.getElementById('<%=txtsSospesa.ClientID%>').value = "";
                crtl = document.getElementById('<%=trconsuntivo1.ClientID%>').style;
                crtl.display = "none";
                crtl = document.getElementById('<%=trconsuntivo2.ClientID%>').style;
                crtl.display = "none";
                crtl = document.getElementById('<%=trconsuntivo3.ClientID%>').style;
                crtl.display = "none";
                crtl = document.getElementById('<%=trannocontab.ClientID%>').style;
                crtl.display = "none";
                crtl = document.getElementById('<%=trsoddisfazione.ClientID%>').style
                crtl.display = "none";
                crtl = document.getElementById('<%=trannotazione.ClientID%>').style;
                crtl.display = "none";

				//document.getElementById('<%=txtSpesa3.ClientID%>').value = "";
				//document.getElementById('<%=txtSpesa4.ClientID%>').value = "";
                break;
        }
    }
    function SetPreventivo(Stato) {
        //trconsuntivo1.ClientID

        var crtl;
        switch (Stato) {
            case "3": //Straordinaria
                crtl = document.getElementById('<%=tipointervento0.ClientID%>').style;
                crtl.display = "block";
                crtl = document.getElementById('<%=tipointervento1.ClientID%>').style;
                crtl.display = "block";
                crtl = document.getElementById('<%=tipointervento2.ClientID%>').style;
                crtl.display = "block";
                break;
            case "1": //Ordinaria	
                crtl = document.getElementById('<%=tipointervento0.ClientID%>').style;
                crtl.display = "none";
                crtl = document.getElementById('<%=tipointervento1.ClientID%>').style;
                crtl.display = "none";
                crtl = document.getElementById('<%=tipointervento2.ClientID%>').style;
                crtl.display = "none";
                break;
            default:
                crtl = document.getElementById('<%=tipointervento0.ClientID%>').style;
                crtl.display = "none";
                crtl = document.getElementById('<%=tipointervento1.ClientID%>').style;
                crtl.display = "none";
                crtl = document.getElementById('<%=tipointervento2.ClientID%>').style;
                crtl.display = "none";
                break;
        }
    }
    function ApriPopUp(url) {
        var windowW = 1024;
        var windowH = 768;
        W = window.open(url, 'Rapporto', 'menubar=yes,toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes,copyhistory=no,width=' + windowW + ',height=' + windowH + ',align=center');
    }

    function validateDate() {

        if (ControllaData() == false)
            return false;


        //importo preventivo
        var ctrlnumeroIC1 = document.getElementById('<%=txtSpesa3.ClientID%>');
        if (ctrlnumeroIC1.value == "") {
            alert("Inserire l'importo del consuntivo!");
            return false;
        }

        //se è stata selezionata la combo degli stati ad attività completata non
        //deve fare il controllo sulle date

        var ctrlstato = document.getElementById('<%=cmbsstatolavoro.ClientID%>');
        if (ctrlstato != null) {
            if ((ctrlstato.selectedIndex != -1)) {
                if (ctrlstato.value != "4")
                    return true;
            }
        }

        if (validateRange() == false)
            return false;

        //return false; blocca il postback
        //Validazione delle Date
        //Combo delle Urgenze
        var cmbo = document.getElementById('<%=cmbsUrgenza.ClientID%>');
        var selur = cmbo.options[cmbo.selectedIndex].value.split(",");

        //recupero la data inizio Lavori
        var datai = document.getElementById('<%=CalendarPicker2.Datazione.ClientID%>').value;
        var orarioi = document.getElementById('<%=cmbsOraInizio.ClientID%>').value;
        var orarioi2 = document.getElementById('<%=cmbsMinutiInizio.ClientID%>').value;
        if (datai == "") {
            alert("Inserire la Data inizio lavori!");
            return false;
        }
        /*  if (orarioi=="00")
          {
            alert("Inserire la l'orario di inizio dei lavori!" ) ;	
            return false;
          }*/

        var ds = datai.split("/");
        var dinizio = new Date(ds[2], ds[1] - 1, ds[0], orarioi, orarioi2);
        //var dinizio=ds[2]+ds[1]+ds[0]+orarioi+orarioi2;
        if (selur[1] != "") {
            //se esiste l'orario di intervento controllo che la data richiesta
            //recupero la data pianificata /richiesta
            var datap = document.getElementById('<%=lblDataRichiesta.ClientID%>').innerText;
          var orariop = document.getElementById('<%=lblOraRichiesta.ClientID%>').innerText;
            var d1 = datap.split("/");
            var o1 = orariop.split(".");

            //var dpianificata=new Date(d1[2],d1[1],d1[0],o1[0],o1[1]);
            var dpianificata = new Date(d1[2], d1[1] - 1, d1[0], o1[0], o1[1]);
            if ((dinizio - dpianificata) / (1000 * 60 * 60) > selur[1]) {
                var ask = window.confirm("Data non conforme al capitolato. Continuare?");
                return ask;
            }
            else {
                if (dpianificata > dinizio) {
                    alert("La Data Inizio Lavori  è minore della Data richiesta Lavoro!");
                    return false;
                }
                else {
                    return true;
                }
            }
            return true;
        }//end if di selur[1]



    }
    function validateRange() {


        //recupero la data inizio Lavori
        var datai = document.getElementById('<%=CalendarPicker2.Datazione.ClientID%>').value;
        var orarioi1 = document.getElementById('<%=cmbsOraInizio.ClientID%>').value;
        var orarioi2 = document.getElementById('<%=cmbsMinutiInizio.ClientID%>').value;
        if (datai == "") {
            alert("Inserire la Data inizio lavori!");
            return false;
        }
        /* if (orarioi1=="00")
         {
           alert("Inserire la l'orario di inizio dei lavori!" ) ;	
           return false;
         }*/

        var datasplit1 = datai.split("/");
        //var dinizio=new Date(datasplit1[2],datasplit1[1]-1,datasplit1[0],orarioi1,orarioi2,00);
        var dinizio = datasplit1[2] + datasplit1[1] + datasplit1[0] + orarioi1 + orarioi2;
        //recupero la data fine Lavori
        var dataf = document.getElementById('<%=CalendarPicker3.Datazione.ClientID%>').value;
        var orariof1 = document.getElementById('<%=cmbsOraFine.ClientID%>').value;
        var orarioif2 = document.getElementById('<%=cmbsMinutiFine.ClientID%>').value;
        if (dataf == "") {
            alert("Inserire la Data Fine Lavori!");
            return false;
        }
		/*if (orariof1=="00")
		{
			alert("Inserire la l'orario di Fine dei Lavori!" ) ;	
			return false;
		}  */

        var datasplit2 = dataf.split("/");
        //var dfine=new Date(datasplit2[2],datasplit2[1],datasplit2[0],orariof1,orarioif2,00);
        var dfine = datasplit2[2] + datasplit2[1] + datasplit2[0] + orariof1 + orarioif2;

        if (dinizio > dfine) {
            alert("Data Inizio Lavori non può essere maggiore della Data Fine Lavori!");
            return false;
        } else {
            return true;
        }
    }

    function Ripristina(sender, name) {
        sender.disabled = false;
        sender.value = name;
    }
    function ControllaData() {

        if (controllaimporto() == false)
            return false;

        if (ControllaCombo() == false)
            return false;

        var oremagg = document.getElementById('<%=cmbsOre.ClientID%>').value
        var minutimagg = document.getElementById('<%=cmbsMinuti.ClientID%>').value
        var datamagg = document.getElementById('<%=CalendarPicker1.Datazione.ClientID%>').value

        var datamin = document.getElementById('<%=lblDataRichiesta.ClientID%>').innerText
        var oramin = document.getElementById('<%=lblOraRichiesta.ClientID%>').innerText

        var orario = oramin.split(":");

        var ore = orario[0];
        var minuti = orario[1] && orario[1] || '0';

        if (ore.length == 1) {
            ore = "0" + ore;
        }

        if (minuti.length == 1) {
            minuti = "0" + minuti;
        }

        oramin = ore + minuti;


        if (datamagg == "") {
            alert("La data di Pianificazione è obbligatoria");
            document.getElementById('<%=CalendarPicker1.Datazione.ClientID%>').focus();
            return false;
        }

        var Data1 = datamagg.substr(6, 4) + datamagg.substr(3, 2) + datamagg.substr(0, 2);
        Data1 = Data1 + oremagg + minutimagg

        var Data2 = datamin.substr(6, 4) + datamin.substr(3, 2) + datamin.substr(0, 2);
        //Data2 = Data2 + oramin.substr(0,2) + oramin.substr(3,2)
        Data2 = Data2 + oramin;


        if (Data2 > Data1) {
            alert("La data Pianificata non è corretta. Inserire una data successiva a quella della Richiesta.");
            document.getElementById('<%=CalendarPicker1.Datazione.ClientID%>').focus();
            return false;
        }

        return true;
    }

    function ControllaCombo() {
        var ctrlditta = document.getElementById('<%=cmbsDitta.ClientID%>');
        if ((ctrlditta.selectedIndex == -1))// || (ctrlditta.selectedIndex==0)) 
        {
            alert("Selezionare una Ditta!");
            return false;
        }
        var ctrladdetto = document.getElementById('<%=cmbsAddetto.ClientID%>');
        if ((ctrladdetto.selectedIndex == -1) || (ctrladdetto.selectedIndex == 0)) {
            alert("Selezionare un Addetto!");
            return false;
        }

        var ctrlservizio = document.getElementById('<%=cmbsServizio.ClientID%>');
        if ((ctrlservizio.selectedIndex == -1) || (ctrlservizio.selectedIndex == 0)) {
            alert("Selezionare il Servizio!");
            return false;
        }
        var ctrTipoInter = document.getElementById('<%=cmbsTipoManutenzione.ClientID%>');
        if (ctrTipoInter.options[ctrTipoInter.selectedIndex].value == "3") {
            //Numero preventivo
            var ctrlnumeroP = document.getElementById('<%=txtNumeroPreventivo.ClientID%>');
			/*if(ctrlnumeroP!=null)
				if (ctrlnumeroP.value=="") 
				{
					alert("Inserire il numero del preventivo!");
					ctrlnumeroP.focus();
					return false;
				}*/

            //importo preventivo
            var ctrlnumeroIP1 = document.getElementById('<%=txtSpesa1.ClientID%>');
            if (ctrlnumeroIP1 != null)
                if (ctrlnumeroIP1.value == "") {
                    ctrlnumeroIP1.focus();
                    alert("Inserire l'importo del preventivo!");
                    return false;
                }
        }


        var ctrlstato = document.getElementById('<%=cmbsstatolavoro.ClientID%>');
        if (ctrlstato != null) {
            if ((ctrlstato.selectedIndex == -1) || (ctrlstato.selectedIndex == 0)) {
                alert("Selezionare lo Stato di Richiesta di Lavoro!");
                return false;
            }
        }
    }
    var finestra;

    function openpdf(sender, path, namefile) {
        var url;
        namefile = namefile.replace("`", "'");
        url = "Visualpdf.aspx?wr_id=" + sender + "&path=" + path + "&name=" + namefile;
        finestra = window.open(url, '', 'menubar=yes,toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes,copyhistory=no,width=800,height=600,align=center');
    }

    function chiudi() {
        if (finestra != null)
            finestra.close();
    }

    function controllaimporto() {
   /*var ctrlTipoMan=document.getElementById('<%=cmbsTipoManutenzione.ClientID%>');
     if (ctrlTipoMan.options[ctrlTipoMan.selectedIndex].value != "3")
         return;


     var ctrlspesa = document.getElementById('<%=txtspesaPresunta1.ClientID%>').value;
     ctrlspesa = ctrlspesa.replace(".", "")
     ctrlspesa = ctrlspesa + "." + document.getElementById('<%=txtspesaPresunta2.ClientID%>').value;
     ctrlspesa = parseFloat(ctrlspesa);
     if (document.getElementById('<%=txtSpesa1.ClientID%>') == null)
         return;

     var ctrlpreventivo1 = document.getElementById('<%=txtSpesa1.ClientID%>').value;
     var ctrlpreventivo2 = document.getElementById('<%=txtSpesa2.ClientID%>').value;
        var ctrlpreventivo = parseFloat(ctrlpreventivo1 + "." + ctrlpreventivo2);
        if (ctrlpreventivo > ctrlspesa) {
            alert("L'importo del preventivo non può essere maggiore della spesa presunta!");
            return false;
        }
	
	* /
        return true;

    }

    function ControllaDateSpesaPresunta() {
        var ctrlTipoMan = document.getElementById('<%=cmbsTipoManutenzione.ClientID%>');
     if (ctrlTipoMan.options[ctrlTipoMan.selectedIndex].value != "3")
         return;

     var ctrDataIni = document.getElementById('<%=CalendarPicker4.Datazione.ClientID%>').value;
     var ctrDataEnd = document.getElementById('<%=CalendarPicker5.Datazione.ClientID%>').value;
     if (ctrDataIni == "") {
         alert("Inserire la Data prevista inizio lavori!");
         return false;
     }
     if (ctrDataEnd == "") {
         alert("Inserire la Data prevista fine lavori!");
         return false;
     }
     var ds = ctrDataIni.split("/");
     var dinizio = new Date(ds[2], ds[1] - 1, ds[0], 00, 00);
     var de = ctrDataEnd.split("/");
     var dfine = new Date(de[2], de[1] - 1, de[0], 00, 00);

     if (dinizio > dfine) {
         alert("La data prevista di inizio lavori non può essere maggiore della data di fine!");
         return false;
     }


     var ctrlOrdineAter = document.getElementById('<%=txtOrdineLavoro.ClientID%>');
     /*if(ctrlOrdineAter.value=="")
     {
       alert("L'ordine di lavoro è obbligatorio!" ) ;	
       ctrlOrdineAter.focus();
       return false;
     }*/

     var ctrlspesa = document.getElementById('<%=txtspesaPresunta1.ClientID%>');
        if (ctrlspesa.value == "") {
            alert("Inserire la spesa presunta!");
            ctrlspesa.focus();
            return false;
        }
        return true;
    }
</script>
<table id="Table1" cellspacing="1" cellpadding="1" width="100%" border="0">
    <tr>
        <td>
            <asp:Label ID="lblOperazione" runat="server" CssClass="TitleOperazione"></asp:Label><cc2:MessagePanel ID="PanelMess" runat="server" Width="136px" ErrorIconUrl="~/Images/ico_critical.gif"
                MessageIconUrl="~/Images/ico_info.gif">
            </cc2:MessagePanel>
        </td>
    </tr>
    <tr>
        <td style="height: 513px">
            <cc2:DataPanel ID="PanelGeneral" runat="server" CssClass="DataPanel75" TitleStyle-CssClass="TitleSearch"
                Collapsed="False" TitleText="Creazione Richiesta di Lavoro" ExpandText="Espandi" ExpandImageUrl="../Images/down.gif"
                CollapseText="Riduci" CollapseImageUrl="../Images/up.gif" AllowTitleExpandCollapse="True">
                <table id="tblSearch100" cellspacing="1" cellpadding="2" width="100%" border="0">
                    <tr>
                        <td style="height: 12px" width="20%"><b>RDL N°</b></td>
                        <td style="width: 169px; height: 12px">
                            <asp:Label ID="LblRdl" runat="server" Width="174px"></asp:Label></td>
                        <td style="height: 12px"><b>Trasmissione:</b></td>
                        <td style="height: 12px">
                            <cc1:S_ComboBox ID="cmbsTrasmissione" runat="server" Width="192px"></cc1:S_ComboBox></td>
                    </tr>
                    <tr>
                        <td style="height: 12px"><b>Nominativo Richiedente:</b></td>
                        <td style="width: 169px; height: 12px">
                            <asp:Label ID="lblRichiedente" runat="server" Width="174px"></asp:Label></td>
                        <td style="height: 12px"><b>Operatore:</b></td>
                        <td style="height: 12px">
                            <asp:Label ID="lblOperatore" runat="server" Width="128px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Telefono Richiedente:</b></td>
                        <td>
                            <asp:Label ID="lbltelefonoric" runat="server" Width="174px"></asp:Label></td>
                        <td style="height: 29px"><b>Data Richiesta:</b></td>
                        <td style="height: 29px">
                            <asp:Label ID="lblDataRichiesta" runat="server" Width="128px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Gruppo Richiedente:</b></td>
                        <td style="width: 169px">
                            <asp:Label ID="lblGruppo" runat="server" Width="174px"></asp:Label></td>
                        <td><b>Orario Richiesta:</b></td>
                        <td>
                            <asp:Label ID="lblOraRichiesta" runat="server" Width="128px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Email Richiedente:</b></td>
                        <td style="width: 169px">
                            <asp:Label ID="lblemailric" runat="server" Width="174px"></asp:Label></td>
                        <td><b>Stanza Richiedente:</b></td>
                        <td>
                            <asp:Label ID="lblstanzaric" runat="server" Width="128px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Fabbricato:</b></td>
                        <td colspan="3">
                            <asp:Label ID="lblfabbricato" runat="server" Width="472px"></asp:Label>
                            <asp:TextBox ID="txtHidBl" runat="server" Width="0px" Visible="False"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><b>Piano:</b></td>
                        <td style="width: 169px">
                            <asp:Label ID="lblPiano" runat="server" Width="174px"></asp:Label></td>
                        <td><b>Stanza:</b></td>
                        <td>
                            <asp:Label ID="lblStanza" runat="server" Width="174px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Telefono:</b></td>
                        <td colspan="3">
                            <asp:Label ID="lblTelefono" runat="server" Width="174px"></asp:Label></td>
                        <tr>
                            <td><b>Note:</b></td>
                            <td colspan="3">
                                <asp:Label ID="lblNote" runat="server" Width="472px"></asp:Label></td>
                        </tr>
                    <tr>
                        <td style="height: 24px"><b>Servizio:</b></td>
                        <td style="height: 24px" colspan="3">
                            <cc1:S_ComboBox ID="cmbsServizio" runat="server" Width="480px" AutoPostBack="True"></cc1:S_ComboBox></td>
                    </tr>
                    <tr>
                        <td style="height: 17px"><b>Standard Apparecchiatura:</b></td>
                        <td style="height: 17px" colspan="3">
                            <cc1:S_ComboBox ID="cmdsStdApparecchiatura" runat="server" Width="480px" AutoPostBack="True" DBIndex="1"
                                DBDirection="Input" DBDataType="Integer" DBParameterName="p_eqstd_id" DBSize="10">
                            </cc1:S_ComboBox></td>
                    </tr>
                    <tr>
                        <td><b>Apparecchiatura:</b></td>
                        <td colspan="3">
                            <cc1:S_ComboBox ID="cmbEQ" runat="server" Width="480px" DBIndex="1" DBDirection="Input" DBDataType="Integer"
                                DBParameterName="p_id_eq" DBSize="10">
                            </cc1:S_ComboBox></td>
                    </tr>
                    <tr>
                        <td><b>Descrizione Intervento:</b></td>
                        <td colspan="3">
                            <cc1:S_TextBox ID="txtsDescrizione" runat="server" Width="480px" TextMode="MultiLine" Height="120px"></cc1:S_TextBox></td>
                    </tr>
                </table>
                <uc1:VisualizzaSolleciti ID="VisualizzaSolleciti1" runat="server"></uc1:VisualizzaSolleciti>
            </cc2:DataPanel>
        </td>
    </tr>
    <tr>
        <td>
            <cc2:DataPanel ID="PanelDCSIT" runat="server" CssClass="DataPanel75" TitleStyle-CssClass="TitleSearch"
                Collapsed="False" TitleText="Validazione da parte del COLLABORATORE" ExpandText="Espandi" ExpandImageUrl="../Images/down.gif"
                CollapseText="Riduci" CollapseImageUrl="../Images/up.gif" AllowTitleExpandCollapse="True" Visible="False">
                <table id="Table2" cellspacing="1" cellpadding="1" width="100%" border="0">
                    <tr>
                        <td colspan="4">&nbsp;
							<cc1:S_Button ID="btsApprovaDCSIT" runat="server" Width="128px" Text="Approva"></cc1:S_Button>&nbsp;
							<cc1:S_Button ID="btsRifiutaDCSIT" runat="server" Width="128px" Text="Rifiuta" CausesValidation="False"></cc1:S_Button></td>
                    </tr>
                    <tr>
                        <td style="width: 170px; height: 12px"><b>Data di validazione:</b></td>
                        <td>
                            <cc1:S_Label ID="lbldatavalidDCSIT" runat="server"></cc1:S_Label></td>
                        <td style="width: 143px; height: 17px"><b>Ora validazione:</b></td>
                        <td>
                            <cc1:S_Label ID="lblOraValidDCSIT" runat="server"></cc1:S_Label></td>
                    </tr>
                    <tr>
                        <td style="width: 172px; height: 17px"><b>Utente:</b></td>
                        <td>
                            <cc1:S_Label ID="lblUtenteDCSIT" runat="server"></cc1:S_Label></td>
                        <td style="width: 143px; height: 17px"><b>Stato:</b></td>
                        <td>
                            <cc1:S_Label ID="lblStatoDCSIT" runat="server"></cc1:S_Label></td>
                    </tr>
                </table>
            </cc2:DataPanel>
        </td>
    </tr>
    <tr>
        <td>
            <cc2:DataPanel ID="PanelDL" runat="server" CssClass="DataPanel75" TitleStyle-CssClass="TitleSearch"
                Collapsed="False" TitleText="Validazione da parte del Responsabile della Manutenzione" ExpandText="Espandi"
                ExpandImageUrl="../Images/down.gif" CollapseText="Riduci" CollapseImageUrl="../Images/up.gif"
                AllowTitleExpandCollapse="True">
                <table id="Table3" cellspacing="1" cellpadding="1" width="100%" border="0">
                    <tr>
                        <td colspan="4">&nbsp;
							<cc1:S_Button ID="btsApprovaDL" runat="server" Width="128px" Text="Approva"></cc1:S_Button>&nbsp;
							<cc1:S_Button ID="btsRifiutaDL" runat="server" Width="128px" Text="Rifiuta" CausesValidation="False"></cc1:S_Button></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 170px; height: 12px"><b>Data di validazione:</b></td>
                        <td>
                            <cc1:S_Label ID="lblDataValidDL" runat="server"></cc1:S_Label></td>
                        <td style="width: 143px; height: 17px"><b>Ora validazione:</b></td>
                        <td>
                            <cc1:S_Label ID="lblOraValidDL" runat="server"></cc1:S_Label></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 170px; height: 12px"><strong>Tipo Manutenzione:</strong></td>
                        <td>
                            <cc1:S_ComboBox ID="cmbsTipoManutenzione" runat="server" Width="196px"></cc1:S_ComboBox></td>
                        <td colspan="2"><strong>Lavoro da quantificare successivamente&nbsp;:</strong>
                            <cc1:S_CheckBox ID="checkQuantifica" runat="server" DBDirection="Input" DBDataType="Integer" Font-Bold="True"></cc1:S_CheckBox></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 172px; height: 17px"><strong>Utente:</strong></td>
                        <td>
                            <cc1:S_Label ID="lblUtenteDL" runat="server"></cc1:S_Label></td>
                        <td style="width: 143px; height: 17px"><b>Stato:</b></td>
                        <td>
                            <cc1:S_Label ID="lblStatoDL" runat="server"></cc1:S_Label></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr id="preventivo1" runat="server">
                        <td><b>Preventivo n°<em>(max 8 caratteri):</em></b></td>
                        <td style="width: 169px">
                            <cc1:S_TextBox ID="txtNumeroPreventivo" runat="server" Width="196px" DBSize="8" MaxLength="8"></cc1:S_TextBox></td>
                        <td><b>Importo Preventivo:</b></td>
                        <td>
                            <cc1:S_TextBox ID="txtSpesa1" Style="text-align: right" runat="server" Width="107px" MaxLength="8">0</cc1:S_TextBox>,
							<cc1:S_TextBox ID="txtSpesa2" runat="server" Width="27px" MaxLength="2">00</cc1:S_TextBox></td>
                    </tr>
                    <tr id="preventivo2" runat="server">
                        <td><b>Importa Preventivo(PDF):</b></td>
                        <td style="width: 169px" colspan="3">
                            <input id="UploadFilePreventivo" style="width: 352px; height: 22px" type="file" size="39"
                                name="UploadFilePreventivo" runat="server"></td>
                    </tr>
                    <tr id="preventivo3" runat="server">
                        <td colspan="4">
                            <!--<B>Preventivo n°<EM>(max 8 caratteri):</EM></B>
							<cc1:S_Label id="lblPreventivo" runat="server"></cc1:S_Label>&nbsp;<B>Importo 
								Preventivo:</B>
							<cc1:S_Label id="lblPreventivoImporto" runat="server"></cc1:S_Label>&nbsp;<B>File 
								Preventivo:&nbsp;</B>-->
                            <cc1:S_HyperLink ID="LinkPreventivo" runat="server"></cc1:S_HyperLink></td>
                    </tr>
                    <tr id="tipointervento0" runat="server">
                        <td style="width: 172px; height: 17px"><strong>Ordine di lavoro UNIBA:</strong></td>
                        <td>
                            <cc1:S_TextBox ID="txtOrdineLavoro" runat="server"></cc1:S_TextBox></td>
                        <td style="width: 143px; height: 17px"></td>
                        <td colspan="3"></td>
                    </tr>
                    <tr id="tipointervento1" runat="server">
                        <td style="width: 172px; height: 17px"><strong>Tipo Intervento:</strong></td>
                        <td>
                            <cc1:S_ComboBox ID="cmbsTipoIntrevento" runat="server" Width="224px" DBDataType="Integer"></cc1:S_ComboBox></td>
                        <td style="display: none; width: 143px; height: 17px"><strong>Spesa Presunta:</strong></td>
                        <td style="display: none" colspan="3">
                            <cc1:S_TextBox ID="txtspesaPresunta1" Style="text-align: right" runat="server" Width="154px" MaxLength="8">00</cc1:S_TextBox>,
							<cc1:S_TextBox ID="txtspesaPresunta2" runat="server" Width="32px" MaxLength="2">00</cc1:S_TextBox></td>
                    </tr>
                    <tr id="tipointervento2" runat="server">
                        <td style="width: 172px; height: 17px"><strong>Data prevista Inizio:</strong></td>
                        <td>
                            <uc1:CalendarPicker ID="CalendarPicker4" runat="server"></uc1:CalendarPicker>
                        </td>
                        <td style="width: 143px; height: 17px"><strong>Data Fine:</strong></td>
                        <td colspan="3">
                            <uc1:CalendarPicker ID="CalendarPicker5" runat="server"></uc1:CalendarPicker>
                        </td>
                    </tr>
                </table>
            </cc2:DataPanel>
        </td>
    </tr>
    <tr>
        <td>
            <cc2:DataPanel ID="PanelCofatec" runat="server" CssClass="DataPanel75" TitleStyle-CssClass="TitleSearch"
                Collapsed="False" TitleText="Emissione Ordine di Lavoro" ExpandText="Espandi" ExpandImageUrl="../Images/down.gif"
                CollapseText="Riduci" CollapseImageUrl="../Images/up.gif" AllowTitleExpandCollapse="True">
                <table id="Tableordine" cellspacing="1" cellpadding="1" width="100%" border="0" runat="server">
                    <tr>
                        <td style="height: 29px" width="20%"><b>Ordine di lavoro:</b>
                        </td>
                        <td>
                            <cc1:S_Label ID="S_Lblordinelavoro" runat="server"></cc1:S_Label></td>
                    </tr>
                </table>
                <table id="Table5" cellspacing="1" cellpadding="2" width="100%" border="0">
                    <tr>
                        <td style="height: 29px" width="20%"><b>Ditta Esecutrice:</b></td>
                        <td style="width: 169px; height: 29px">
                            <cc1:S_ComboBox ID="cmbsDitta" runat="server" Width="196px" AutoPostBack="True"></cc1:S_ComboBox></td>
                        <td style="height: 29px"><b>Addetto:</b></td>
                        <td style="height: 29px">
                            <cc1:S_ComboBox ID="cmbsAddetto" runat="server" Width="184px"></cc1:S_ComboBox></td>
                    </tr>
                    <tr>
                        <td style="height: 16px"><b><b>Urgenza:</b></b></td>
                        <td style="width: 169px; height: 16px">
                            <cc1:S_ComboBox ID="cmbsUrgenza" runat="server" Width="196px"></cc1:S_ComboBox></td>
                        <td style="height: 16px"><b></b></td>
                        <td style="height: 16px"></td>
                    </tr>
                    <tr>
                        <td style="height: 32px"><b>Data Pianificata:</b></td>
                        <td style="width: 169px; height: 32px">
                            <uc1:CalendarPicker ID="CalendarPicker1" runat="server"></uc1:CalendarPicker>
                        </td>
                        <td style="height: 32px"><b>Orario Pianificato:</b></td>
                        <td style="height: 32px">
                            <table id="Table4" cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td nowrap height="15" rowspan="2"></td>
                                    <td nowrap>
                                        <cc1:S_ComboBox ID="cmbsOre" runat="server" DBDataType="Integer">
                                            <asp:ListItem Value="00">00</asp:ListItem>
                                            <asp:ListItem Value="01">01</asp:ListItem>
                                            <asp:ListItem Value="02">02</asp:ListItem>
                                            <asp:ListItem Value="03">03</asp:ListItem>
                                            <asp:ListItem Value="04">04</asp:ListItem>
                                            <asp:ListItem Value="05">05</asp:ListItem>
                                            <asp:ListItem Value="06">06</asp:ListItem>
                                            <asp:ListItem Value="07">07</asp:ListItem>
                                            <asp:ListItem Value="08">08</asp:ListItem>
                                            <asp:ListItem Value="09">09</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="11">11</asp:ListItem>
                                            <asp:ListItem Value="12">12</asp:ListItem>
                                            <asp:ListItem Value="13">13</asp:ListItem>
                                            <asp:ListItem Value="14">14</asp:ListItem>
                                            <asp:ListItem Value="15">15</asp:ListItem>
                                            <asp:ListItem Value="16">16</asp:ListItem>
                                            <asp:ListItem Value="17">17</asp:ListItem>
                                            <asp:ListItem Value="18">18</asp:ListItem>
                                            <asp:ListItem Value="19">19</asp:ListItem>
                                            <asp:ListItem Value="20">20</asp:ListItem>
                                            <asp:ListItem Value="21">21</asp:ListItem>
                                            <asp:ListItem Value="22">22</asp:ListItem>
                                            <asp:ListItem Value="23">23</asp:ListItem>
                                        </cc1:S_ComboBox></td>
                                    <td nowrap height="15" rowspan="2"><font face="Arial" size="-1"><B>:</B></font>
                                    </td>
                                    <td nowrap height="15" rowspan="2">
                                        <cc1:S_ComboBox ID="cmbsMinuti" runat="server" Width="64px" DBDataType="Integer">
                                            <asp:ListItem Value="00">00</asp:ListItem>
                                            <asp:ListItem Value="15">15</asp:ListItem>
                                            <asp:ListItem Value="30">30</asp:ListItem>
                                            <asp:ListItem Value="45">45</asp:ListItem>
                                        </cc1:S_ComboBox></td>
                                    <td nowrap></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Label ID="LblMessaggio" runat="server" Width="560px"></asp:Label></td>
                    </tr>
                </table>
                <table id="TableEmetti" align="center" runat="server">
                    <tr>
                        <td>
                            <asp:Button ID="btnRifiuta" runat="server" Text="Rifiuta" CausesValidation="False"></asp:Button></td>
                        <td>
                            <asp:Button ID="btnSospendi" runat="server" Text="Sospendi" CausesValidation="False"></asp:Button></td>
                        <td>
                            <asp:Button ID="btnApprova" runat="server" Text="Approva ed Emetti"></asp:Button></td>
                        <td>
                            <asp:Button ID="btnHelp" runat="server" Text="Aiuto" CausesValidation="False"></asp:Button></td>
                    </tr>
                </table>
            </cc2:DataPanel>
        </td>
    </tr>
    <tr>
        <td>
            <cc2:DataPanel ID="PanelCompleta" runat="server" CssClass="DataPanel75" TitleStyle-CssClass="TitleSearch"
                Collapsed="False" TitleText="Completamento Ordine di Lavoro" ExpandText="Espandi" ExpandImageUrl="../Images/down.gif"
                CollapseText="Riduci" CollapseImageUrl="../Images/up.gif" AllowTitleExpandCollapse="True">
                <table id="Table7" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td width="20%"><b>Stato Richiesta di Lavoro:</b></td>
                        <td>
                            <cc1:S_ComboBox ID="cmbsstatolavoro" runat="server" Width="255px"></cc1:S_ComboBox></td>
                    </tr>
                    <tr id="trnote" runat="server">
                        <td width="20%"><b>Sospesa per:</b></td>
                        <td>
                            <cc1:S_TextBox ID="txtsSospesa" runat="server" Width="408px" TextMode="MultiLine" Height="70px"></cc1:S_TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table id="Table6" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td width="20%"><b>Data inizio:</b></td>
                                    <td style="width: 227px">
                                        <uc1:CalendarPicker ID="CalendarPicker2" runat="server"></uc1:CalendarPicker>
                                    </td>
                                    <td><b>Ora Inizio:</b></td>
                                    <td>
                                        <table id="Tablecompletamento" cellspacing="0" cellpadding="0" border="0" runat="server">
                                            <tr>
                                                <td nowrap height="15" rowspan="2"></td>
                                                <td nowrap>
                                                    <cc1:S_ComboBox ID="cmbsOraInizio" runat="server" DBDataType="Integer">
                                                        <asp:ListItem Value="00">00</asp:ListItem>
                                                        <asp:ListItem Value="01">01</asp:ListItem>
                                                        <asp:ListItem Value="02">02</asp:ListItem>
                                                        <asp:ListItem Value="03">03</asp:ListItem>
                                                        <asp:ListItem Value="04">04</asp:ListItem>
                                                        <asp:ListItem Value="05">05</asp:ListItem>
                                                        <asp:ListItem Value="06">06</asp:ListItem>
                                                        <asp:ListItem Value="07">07</asp:ListItem>
                                                        <asp:ListItem Value="08">08</asp:ListItem>
                                                        <asp:ListItem Value="09">09</asp:ListItem>
                                                        <asp:ListItem Value="10">10</asp:ListItem>
                                                        <asp:ListItem Value="11">11</asp:ListItem>
                                                        <asp:ListItem Value="12">12</asp:ListItem>
                                                        <asp:ListItem Value="13">13</asp:ListItem>
                                                        <asp:ListItem Value="14">14</asp:ListItem>
                                                        <asp:ListItem Value="15">15</asp:ListItem>
                                                        <asp:ListItem Value="16">16</asp:ListItem>
                                                        <asp:ListItem Value="17">17</asp:ListItem>
                                                        <asp:ListItem Value="18">18</asp:ListItem>
                                                        <asp:ListItem Value="19">19</asp:ListItem>
                                                        <asp:ListItem Value="20">20</asp:ListItem>
                                                        <asp:ListItem Value="21">21</asp:ListItem>
                                                        <asp:ListItem Value="22">22</asp:ListItem>
                                                        <asp:ListItem Value="23">23</asp:ListItem>
                                                    </cc1:S_ComboBox></td>
                                                <td nowrap height="15" rowspan="2"><font face="Arial" size="-1"><B>:</B></font>
                                                </td>
                                                <td nowrap height="15" rowspan="2">
                                                    <cc1:S_ComboBox ID="cmbsMinutiInizio" runat="server" Width="64px" DBDataType="Integer">
                                                        <asp:ListItem Value="00">00</asp:ListItem>
                                                        <asp:ListItem Value="15">15</asp:ListItem>
                                                        <asp:ListItem Value="30">30</asp:ListItem>
                                                        <asp:ListItem Value="45">45</asp:ListItem>
                                                    </cc1:S_ComboBox></td>
                                                <td nowrap></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%"><b>Data Fine:</b></td>
                                    <td style="width: 227px">
                                        <uc1:CalendarPicker ID="CalendarPicker3" runat="server"></uc1:CalendarPicker>
                                    </td>
                                    <td><b>Ora Fine:</b></td>
                                    <td>
                                        <table id="Table8" cellspacing="0" cellpadding="0" border="0">
                                            <tr>
                                                <td nowrap height="15" rowspan="2"></td>
                                                <td nowrap>
                                                    <cc1:S_ComboBox ID="cmbsOraFine" runat="server" DBDataType="Integer">
                                                        <asp:ListItem Value="00">00</asp:ListItem>
                                                        <asp:ListItem Value="01">01</asp:ListItem>
                                                        <asp:ListItem Value="02">02</asp:ListItem>
                                                        <asp:ListItem Value="03">03</asp:ListItem>
                                                        <asp:ListItem Value="04">04</asp:ListItem>
                                                        <asp:ListItem Value="05">05</asp:ListItem>
                                                        <asp:ListItem Value="06">06</asp:ListItem>
                                                        <asp:ListItem Value="07">07</asp:ListItem>
                                                        <asp:ListItem Value="08">08</asp:ListItem>
                                                        <asp:ListItem Value="09">09</asp:ListItem>
                                                        <asp:ListItem Value="10">10</asp:ListItem>
                                                        <asp:ListItem Value="11">11</asp:ListItem>
                                                        <asp:ListItem Value="12">12</asp:ListItem>
                                                        <asp:ListItem Value="13">13</asp:ListItem>
                                                        <asp:ListItem Value="14">14</asp:ListItem>
                                                        <asp:ListItem Value="15">15</asp:ListItem>
                                                        <asp:ListItem Value="16">16</asp:ListItem>
                                                        <asp:ListItem Value="17">17</asp:ListItem>
                                                        <asp:ListItem Value="18">18</asp:ListItem>
                                                        <asp:ListItem Value="19">19</asp:ListItem>
                                                        <asp:ListItem Value="20">20</asp:ListItem>
                                                        <asp:ListItem Value="21">21</asp:ListItem>
                                                        <asp:ListItem Value="22">22</asp:ListItem>
                                                        <asp:ListItem Value="23">23</asp:ListItem>
                                                    </cc1:S_ComboBox></td>
                                                <td nowrap height="15" rowspan="2"><font face="Arial" size="-1"><B>:</B></font>
                                                </td>
                                                <td nowrap height="15" rowspan="2">
                                                    <cc1:S_ComboBox ID="cmbsMinutiFine" runat="server" Width="64px" DBDataType="Integer">
                                                        <asp:ListItem Value="00">00</asp:ListItem>
                                                        <asp:ListItem Value="15">15</asp:ListItem>
                                                        <asp:ListItem Value="30">30</asp:ListItem>
                                                        <asp:ListItem Value="45">45</asp:ListItem>
                                                    </cc1:S_ComboBox></td>
                                                <td nowrap></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="trannotazione" runat="server">
                        <td style="width: 171px"><b></b></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 171px"><b>Annotazioni Materiale Utilizzato:</b></td>
                        <td>
                            <cc1:S_TextBox ID="txtsAnnotazioni" runat="server" Width="408px" TextMode="MultiLine" Height="70px"></cc1:S_TextBox></td>
                    </tr>
                    <tr>
                    <tr id="trconsuntivo1" style="visibility: hidden" runat="server">
                        <td><b>Importo a Consuntivo:</b></td>
                        <td>
                            <cc1:S_TextBox ID="txtSpesa3" Style="text-align: right" runat="server" Width="154px" MaxLength="8">0</cc1:S_TextBox>,
							<cc1:S_TextBox ID="txtSpesa4" runat="server" Width="32px" MaxLength="2">00</cc1:S_TextBox></td>
                    </tr>
                    <tr id="trconsuntivo2" style="visibility: hidden" runat="server">
                        <td><b>Contabilizzazione:</b></td>
                        <td>
                            <cc1:S_ComboBox ID="cmbContabilizzazione" runat="server" Width="255px"></cc1:S_ComboBox></td>
                    </tr>
                    <tr id="trannocontab" style="visibility: hidden" runat="server">
                        <td><b>Anno Contabilizzazione:</b></td>
                        <td>
                            <cc1:S_ComboBox ID="cmbsAnnoContab" runat="server" Width="255px"></cc1:S_ComboBox></td>
                    </tr>
                    <tr id="trconsuntivo3" style="visibility: hidden" runat="server">
                        <td colspan="2"><b>
                            <asp:Label ID="lblconsuntivo" runat="server">Importa Consuntivo(PDF): </asp:Label></b><input id="UploadFileCosto" style="width: 352px; height: 22px" type="file" size="55" name="UploadFileCosto"
                                runat="server">
                            <cc1:S_HyperLink ID="LinkConsuntivo" runat="server" Visible="False"></cc1:S_HyperLink></td>
                        <td></td>
                    </tr>
                    <tr id="trsoddisfazione" runat="server">
                        <td style="width: 171px"><b>Livello Soddisfazione:</b></td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="4" Selected="True">Non dichiarato</asp:ListItem>
                                <asp:ListItem Value="1">Non Soddisfatto</asp:ListItem>
                                <asp:ListItem Value="2">Soddisfatto</asp:ListItem>
                                <asp:ListItem Value="3">Pienamente Soddisfatto</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                        <td></td>
                    </tr>
                </table>
                <table id="TableCompleta" style="height: 29px" cellspacing="0" cellpadding="0" width="516"
                    align="center" border="0" runat="server">
                    <tr>
                        <td>
                            <cc1:S_Button ID="btnCompleta" runat="server" Width="180px" Text="Invia"></cc1:S_Button></td>
                        <td>
							<cc1:S_Button ID="btnfoglioprestazioni" runat="server" Width="180px" Text="Foglio Prestazioni"
                                CausesValidation="False"></cc1:S_Button></td>
                        <td>
                            <cc1:S_Button ID="btnfoglioprestazioniPdf" runat="server" Width="180px" Text="Foglio Prestazioni in Pdf"
                                CausesValidation="False"></cc1:S_Button></td>
                    </tr>
                </table>
            </cc2:DataPanel>
        </td>
    </tr>
    <tr>
        <td align="center">
            <cc1:S_Button ID="BtnCostiOpera" runat="server" Width="180px" Visible="False" Text="Costi Operativi Di Gestione"
                CausesValidation="False"></cc1:S_Button><cc1:S_Button ID="btnChiudicompleta" runat="server" Width="180px" Text="Chiudi" CausesValidation="False"></cc1:S_Button><uc1:AggiungiSollecito ID="AggiungiSollecito1" runat="server"></uc1:AggiungiSollecito>
        </td>
    </tr>
</table>
