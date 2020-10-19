using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Data;
using S_Controls;
using S_Controls.Collections;
using ApplicationDataLayer;
using ApplicationDataLayer.DBType;

namespace TheSite.Classi.AnagrafeImpianti
{
	/// <summary>
	/// Descrizione di riepilogo per PrestazioniEnergetiche.
	/// </summary>
	public class PrestazioniEnergetiche : AbstractBase
	{
		public PrestazioniEnergetiche()
		{
		}
			public override DataSet GetData()
			{
				return null;
			}
		
		public override DataSet GetData(S_ControlsCollection CollezioneControlli)
		{
			DataSet _Ds;		

			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 4;
			CollezioneControlli.Add(s_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_PRESTAZIONI_ENERGETICHE.SP_GETPRESTAZIONI_TECNICHE";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();													
			return _Ds;	
		}

		public override DataSet GetSingleData(int itemId)
		{
			DataSet _Ds;

			S_ControlsCollection _SColl = new S_ControlsCollection();

			S_Controls.Collections.S_Object s_Id = new S_Object();
			s_Id.ParameterName = "p_ID_PRESTAZIONI_ENERGETICHE";
			s_Id.DbType = CustomDBType.Integer;
			s_Id.Direction = ParameterDirection.Input;
			s_Id.Index = 0;
			s_Id.Value = itemId;
			
			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 1;

			_SColl.Add(s_Id);
			_SColl.Add(s_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_PRESTAZIONI_ENERGETICHE.SP_GETSINGLEPREST_TECNICHE";	
			_Ds = _OraDl.GetRows(_SColl, s_StrSql).Copy();			

			this.Id = itemId;
			return _Ds;		
		}
		

		public DataSet GetAllTipo()
		{
			DataSet _Ds;

			S_ControlsCollection _SColl = new S_ControlsCollection();

			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 1;

			_SColl.Add(s_Cursor);
				
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_PRESTAZIONI_ENERGETICHE.SP_GETALL_TIPO_PRESTAZIONI";	
			_Ds = _OraDl.GetRows(_SColl, s_StrSql).Copy();			
			return _Ds;	
		}

		#region Metodi Privati

		public override int Update(S_ControlsCollection CollezioneControlli, int itemId)
		{
			return base.Update (CollezioneControlli, itemId);
		}
		protected override int ExecuteUpdate(S_ControlsCollection CollezioneControlli, ExecuteType Operazione, int itemId)
		{			
			// TIPO OPERAZIONE

			S_Controls.Collections.S_Object s_Operazione = new S_Object();
			s_Operazione.ParameterName = "p_Operazione";
			s_Operazione.DbType = CustomDBType.VarChar;
			s_Operazione.Direction = ParameterDirection.Input;
			s_Operazione.Index = CollezioneControlli.Count;
			s_Operazione.Value = Operazione.ToString();

			CollezioneControlli.Add(s_Operazione);

			// OUT

			S_Controls.Collections.S_Object s_IdOut = new S_Object();
			s_IdOut.ParameterName = "p_IdOut";
			s_IdOut.DbType = CustomDBType.Integer;
			s_IdOut.Direction = ParameterDirection.Output;
			s_IdOut.Index = CollezioneControlli.Count;		
			
			CollezioneControlli.Add(s_IdOut);


			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);

			object i_Result = _OraDl.GetRowsAffected(CollezioneControlli, "PACK_PRESTAZIONI_ENERGETICHE.SP_EXECUTEPRESTAZIONI");
				
			return System.Convert.ToInt32(i_Result);
		}

		#endregion
	}
}