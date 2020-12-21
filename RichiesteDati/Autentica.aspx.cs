using System;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using S_Controls;
using S_Controls.Collections;
using ApplicationDataLayer;
using ApplicationDataLayer.DBType;
using ApplicationSecurity;
using System.Web.Security;

namespace TheSite.RichiesteDati
{
    /// <summary>
    /// Descrizione di riepilogo per Autentica.
    /// </summary>
    public class Autentica : System.Web.UI.Page    // System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Label user;
        protected System.Web.UI.WebControls.Label lblH;
        protected System.Web.UI.WebControls.Label password;
        private string usr;
        private string pwd;

        private void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                user.Text = Request.Params["user"];
                password.Text = Request.Params["password"];

                usr = Request.Params["user"];
                Sicurezza sic = new Sicurezza();
                pwd = sic.EncryptMD5(Request.Params["password"]);


                /*PROCEDURE SP_AUTENTICA_UTENTI (p_UserName in varchar2, 
											   p_Password in varchar2,
											   IO_CURSOR IN OUT T_CURSOR)*/

                S_ControlsCollection _SColl = new S_ControlsCollection();

                S_Controls.Collections.S_Object UserName = new S_Object();
                UserName.ParameterName = "p_UserName";
                UserName.DbType = CustomDBType.VarChar;
                UserName.Size = 50;
                UserName.Direction = ParameterDirection.Input;
                UserName.Value = usr;
                UserName.Index = 0;
                _SColl.Add(UserName);

                S_Controls.Collections.S_Object Password = new S_Object();
                Password.ParameterName = "p_Password";
                Password.DbType = CustomDBType.VarChar;
                Password.Size = 50;
                Password.Direction = ParameterDirection.Input;
                Password.Value = pwd;
                Password.Index = 1;
                _SColl.Add(Password);

                Classi.Utente _Utente = new TheSite.Classi.Utente();

                int res = _Utente.Login(_SColl);

                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();


                if (res > 0)
                {
                    DoLogin();
                }

                Response.AddHeader("autenticato", res.ToString());
            }
            catch (Exception exc)
            {
                lblH.Text = exc.ToString();
            }

        }


        private void DoLogin()
        {
            Classi.Sicurezza _Sic = new Classi.Sicurezza();
            Classi.Utente _Utente = new TheSite.Classi.Utente();

            var pwd = _Sic.EncryptMD5(password.Text);
            //txtsPasword.Text = _Sic.EncryptSHA1(txtsPasword.Text);
            try
            {

                string url = FormsAuthentication.GetRedirectUrl(user.Text, false);
                //					FormsAuthentication.SetAuthCookie(txtsUserName.Text,false);
                //			
                //					Response.Redirect(url);
                string[] a_roles = _Utente.GetRuoli(user.Text);

                string roleStr = "";
                double ore = 8;
                foreach (String role in a_roles)
                {
                    //if(role.ToUpper()=="CALLCENTER")
                    //	ore=8;
                    roleStr += role;
                    roleStr += ";";
                }

                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                    1,
                    user.Text,
                    DateTime.Now,                   // issue time
                    DateTime.Now.AddHours(ore),       // expires every hour
                    false,                          // don't persist cookie
                    roleStr,                        // roles
                    FormsAuthentication.FormsCookiePath);

                // Encrypt the ticket.
                string encTicket = FormsAuthentication.Encrypt(ticket);

                // Create the cookie.
                Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encTicket));

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                lblH.Text = ex.Message;

            }
        }

        #region Codice generato da Progettazione Web Form
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: questa chiamata è richiesta da Progettazione Web Form ASP.NET.
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
