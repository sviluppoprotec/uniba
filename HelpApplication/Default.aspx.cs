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

namespace HelpApplication
{
	/// <summary>
	/// Descrizione di riepilogo per _Default.
	/// </summary>
	public class Default : System.Web.UI.Page    // System.Web.UI.Page
	{
		public string DefaultPage="MainContent.aspx";
		public string LeftPage="LeftFrame.aspx";
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Inserire qui il codice utente necessario per inizializzare la pagina.
//			if(Context.Application["CurrentLink"]!=null)
//				DefaultPage= (string)Context.Application["CurrentLink"];
			if( Request.QueryString["page"]!=null)
				LeftPage+="?page=" + Request.QueryString["page"];
			if( Request.QueryString["page"]!=null)
				DefaultPage="Help/" + Request.QueryString["page"].Replace("aspx","htm");
			
		}

		#region Codice generato da Progettazione Web Form
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: questa chiamata � richiesta da Progettazione Web Form ASP.NET.
			//
			InitializeComponent();
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
