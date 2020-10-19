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

namespace TheSite.Classi.ClassiAnagrafiche
{
	/// <summary>
	/// Summary description for PmpIntervalli.
	/// </summary>
	public class PmpIntervalli:AbstractBase
	{
		public PmpIntervalli()
		{
			//
			// TODO: Add constructor logic here
			//
		}


		#region Dichiarazioni

		DataSet _Ds;
			
		S_ControlsCollection CollezioneControlli = new S_ControlsCollection();

		#endregion

		#region Metodi Pubblici

		public override DataSet GetData()
		{			
			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count + 1;

			CollezioneControlli.Add(s_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_PMP_INTERVALLI.SP_GETALLINTERVALLI";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;				
		}
		public override DataSet GetData(S_ControlsCollection CollezioneControlli)
		{
            return null;			
		}
		public override DataSet GetSingleData(int itemId)
		{
			S_Controls.Collections.S_Object s_Id = new S_Object();
			s_Id.ParameterName = "p_id_intervallo";
			s_Id.DbType = CustomDBType.Integer;
			s_Id.Direction = ParameterDirection.Input;
			s_Id.Index = 0;
			s_Id.Value = itemId;
			
			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 1;

			CollezioneControlli.Add(s_Id);
			CollezioneControlli.Add(s_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_PMP_INTERVALLI.SP_GETSINGLEINTERVALLI";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			this.Id = itemId;
			return _Ds;	
		}

		public DataSet GetMesi()
		{
			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count + 1;

			CollezioneControlli.Add(s_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_PMP_INTERVALLI.SP_GETALLMESI";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;			
		}

		public DataSet GetServizi()
		{
			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count + 1;

			CollezioneControlli.Add(s_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_PMP_INTERVALLI.SP_GETALLSERVIZI";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;			
		}

		#endregion

		#region Metodi privati

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

			int i_Result = _OraDl.GetRowsAffected(CollezioneControlli, "PACK_PMP_INTERVALLI.SP_EXECUTEINTERVALLI");
				
			return i_Result;
		
		}


		#endregion


	}
}
