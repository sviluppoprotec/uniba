using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Web;
using CrystalDecisions.Shared;
using TheSite.Classi.AnalisiStatistiche;
using TheSite.Report;
using S_Controls;
using S_Controls.Collections;
using ApplicationDataLayer;
using ApplicationDataLayer.DBType;
using TheSite.SchemiXSD;
using TheSite.Classi.ManCorrettiva;
using System.IO;

namespace TheSite.ManutenzioneCorrettiva
{
	/// <summary>
	/// Descrizione di riepilogo per RapportoTecnicoInterventoPdf.
	/// </summary>
	public class RapportoTecnicoInterventoPdf : System.Web.UI.Page    // System.Web.UI.Page
	{
		private string pathRptSource;
		private ReportDocument crReportDocument;
		private ExportOptions crExportOptions;
		protected CrystalDecisions.Web.CrystalReportViewer CrystalReportViewer1;
		private DiskFileDestinationOptions crDiskFileDestinationOptions;



		private void Page_Load(object sender, System.EventArgs e)
		{
			IpostaRpt();
		}

		/// <summary>
		/// Imposto tutte le variabili per la generazione del report
		/// Eseguo il Binding sul Repeater
		/// </summary>
		private void IpostaRpt()
		{
			try
			{
				Classi.ManOrdinaria.RichiestaIntervento  _RichiestaIntervento= new Classi.ManOrdinaria.RichiestaIntervento(Context.User.Identity.Name);
				DataSet Ds=_RichiestaIntervento.GetSingleData(int.Parse(Request.QueryString["wo_id"]));
				
				int wr_id = 0;

				foreach (DataRow Dr in Ds.Tables[0].Rows)
				{
					wr_id=Convert.ToInt32(Dr["VAR_WR_WR_ID"]);						
				}	 
				//iserisce la nuova datatable nel dataset che deve essere table(1)
				//quindi se in futuro di aggiunge una nuova datatable al il
				//relativo codice prima di quello che segue
				ClManCorrettiva ioDati = new ClManCorrettiva();
				DataTable Dt = ioDati.GetListaManodopera(wr_id).Tables[0].Copy();
				Dt.TableName="tableCostoPersonale";
				Ds.Tables.Add(Dt);

				//iserisce la nuova datatable nel dataset che deve essere table(1)
				//quindi se in futuro di aggiunge una nuova datatable al il
				//relativo codice prima di quello che segue
				DataTable Dt2 = ioDati.GetListaMateriali(wr_id).Tables[0].Copy();
				Dt2.TableName="tableCostoMateriali";
				Ds.Tables.Add(Dt2);
				int rg = Dt2.Rows.Count;
				Execute(Ds);
			}
			catch(Exception ex)
			{
				Response.Redirect("../ErrorPage.aspx?msgErr="+ex.Message + " *FEDERICO: Durante ilrecupero del dataset dal datalayer");
			}
		}
	
		/// <summary>
		/// Eseguo la store procedure e recupero i campi
		/// Eseguo il Binding sul Repeater
		/// </summary>
		private void Execute(DataSet _dsRpt)
		{
			try
			{
				bool ciSonoCosti = false;
				dsRapportino dsP = new  dsRapportino();
				int i = 0;
				for(i=0; i<=_dsRpt.Tables[0].Rows.Count-1;i++)
				{ 
					dsP.Tables["rapportoTecnicoIntervento"].ImportRow(_dsRpt.Tables[0].Rows[i]);
				}
				if(i==0)
				{
					throw new Exception("* DATI PER IL DOCUMENTO NON PRESENTI");
				}

				i = 0;
				for(i=0; i<=_dsRpt.Tables[1].Rows.Count-1;i++)
				{ 
					dsP.Tables["ListaManodopera"].ImportRow(_dsRpt.Tables[1].Rows[i]);
				}
				if(i==0)
				{
			
					//per inserire una riga

					DataRow o_Dr = dsP.Tables["ListaManodopera"].NewRow();
					o_Dr["ID"]="-1";				
					o_Dr["IdAddetto"]=0;
					o_Dr["IdAddettoWR"]=0;
					o_Dr["CognomeNome"] =DBNull.Value;
					o_Dr["Livello"] ="<b>TOTALE</b>";
					o_Dr["PrezzoUnitario"] =DBNull.Value;
					o_Dr["OreLavorate"]=DBNull.Value;
					o_Dr["Totale"]=0;
					o_Dr["DescrizioneIntervento"]=DBNull.Value;
					dsP.Tables["ListaManodopera"].Rows.Add(o_Dr);
	
				} 
				else 
				{
					ciSonoCosti=true;
				}

				i = 0;
				for(i=0; i<=_dsRpt.Tables[2].Rows.Count-1;i++)
				{ 
					dsP.Tables["ListaMateriali"].ImportRow(_dsRpt.Tables[2].Rows[i]);
				}
				if(i==0)
				{
					//per inserire una riga

					DataRow o_Dr = dsP.Tables["ListaMateriali"].NewRow();
					o_Dr["ID"]="-1";				
					o_Dr["MATERIALE"]=DBNull.Value;
					o_Dr["PREZZO_UNITARIO"]=DBNull.Value;
					o_Dr["UNITAMISURA"] ="";
					o_Dr["QUANTITA"] =0;
					o_Dr["PREZZOTOTALE"] =0;
					o_Dr["ID_MATERIALI"]=-1;
					dsP.Tables["ListaMateriali"].Rows.Add(o_Dr);
				}
				else 
				{
					ciSonoCosti=true;
				}
				float totaleManodoperaF=0;
				float totaleMaterialeF=0;
				if (ciSonoCosti) 
				{

					foreach (DataRow dr in dsP.Tables["ListaManodopera"].Rows)
					{
						totaleManodoperaF += float.Parse(Convert.ToString(dr["TOTALE"]));
					}
					foreach (DataRow dr in dsP.Tables["ListaMateriali"].Rows)
					{
						totaleMaterialeF += float.Parse(Convert.ToString(dr["PREZZOTOTALE"]));
					}

					DataRow o_Dr = dsP.Tables["TOTALI"].NewRow();
					o_Dr["TotaleManodopera"] =totaleManodoperaF;
					o_Dr["TotaleMateriali"]=totaleMaterialeF;
					dsP.Tables["TOTALI"].Rows.Add(o_Dr);

				}

				pathRptSource=Server.MapPath("../Report/RptTecnicoIntervento2.rpt");
				//var r = File.Open(pathRptSource, FileMode.Open);
				//byte[] ba = new byte[r.Length];
				//var cinbt = r.Read(ba, 0, (int)r.Length);
				crReportDocument.Load(pathRptSource);
				// FEDERICO per passare i dati al Rpt, le datatable vanno passate singolarmente
				// crReportDocument.SetDataSource(dsP);
				crReportDocument.Database.Tables["rapportoTecnicoIntervento"].SetDataSource(dsP.Tables["rapportoTecnicoIntervento"]);
				crReportDocument.Database.Tables["ListaManodopera"].SetDataSource(dsP.Tables["ListaManodopera"]);
				crReportDocument.Database.Tables["ListaMateriali"].SetDataSource(dsP.Tables["ListaMateriali"]);
				crReportDocument.Database.Tables["TOTALI"].SetDataSource(dsP.Tables["TOTALI"]);
				string Fname = pathRptSource  + Session.SessionID.ToString() + ".pdf" ;
				crDiskFileDestinationOptions = new DiskFileDestinationOptions();
				crDiskFileDestinationOptions.DiskFileName = Fname;
				crExportOptions = crReportDocument.ExportOptions;
				crExportOptions.DestinationOptions = crDiskFileDestinationOptions;
				crExportOptions.ExportDestinationType = ExportDestinationType.DiskFile;
				crExportOptions.ExportFormatType = ExportFormatType.PortableDocFormat;
				crReportDocument.Export();

				Response.Clear();
				Response.ClearContent();
				Response.ClearHeaders();
				Response.ContentType = "application/pdf";
				Response.AddHeader("Content-Disposition",
					"attachment;filename=\"" + new FileInfo(Fname).Name + "\"");
				Response.WriteFile(Fname);
				Response.Flush();
				Response.Close();
				System.IO.File.Delete(Fname);
				crReportDocument.Close();
				crReportDocument.Dispose();
				GC.Collect();
				//CrystalReportViewer1.ReportSource=Server.MapPath("../Report/RptTecnicoIntervento.rpt");
			}
			catch(Exception ex)
			{
				Server.Transfer("../ErrorPage.aspx?msgErr="+ex.Message + " *FEDERICO: Errore nel riempimento del DataSet");
			}
		}

		#region Codice generato da Progettazione Web Form
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: questa chiamata � richiesta da Progettazione Web Form ASP.NET.
			//
			InitializeComponent();
			crReportDocument=new ReportDocument();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Metodo necessario per il supporto della finestra di progettazione. Non modificare
		/// il contenuto del metodo con l'editor di codice.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
