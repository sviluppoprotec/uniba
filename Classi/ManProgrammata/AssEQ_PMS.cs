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
using System.Data.OracleClient;
//using System;
//using System.Data;
//using System.Data.OracleClient;  

namespace TheSite.Classi.ManProgrammata
{
	/// <summary>
	/// Descrizione di riepilogo per AssEQ_PMS.
	/// </summary>
	public class AssEQ_PMS:AbstractBase
	{
		public AssEQ_PMS()
		{			
		}
		
		/// <summary>
		/// DataSet con tutti i record
		/// </summary>
		/// <returns></returns>
		public override DataSet GetData()
		{
			return null;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="CollezioneControlli"></param>
		/// <returns></returns>
		public override DataSet GetData(S_ControlsCollection CollezioneControlli)
		{
			return null;
		}

		public override DataSet GetSingleData(int itemId)
		{
			return null;
		}

		public string[] GetValueParametri()
		{
			string Result="";
			string[] ParValues = new string[7];
			string[] Result1 = new string[7];;
			string ConnectionString=ConfigurationSettings.AppSettings.Get("ConnectionString");
			string s_StrSql = "PACK_SCHEDULA.getConta_EQ_PMP2";
			OracleConnection connection = new OracleConnection(ConnectionString);
			connection.Open();
			OracleCommand command = new OracleCommand(s_StrSql,connection);
			command.CommandType = System.Data.CommandType.StoredProcedure;
					
			OracleParameter p4 = new OracleParameter("st",OracleType.VarChar,1000);
			p4.Value     = "";
			p4.Direction = System.Data.ParameterDirection.InputOutput;
			command.Parameters.Add(p4);

			command.ExecuteNonQuery();
			Result=p4.Value.ToString();
			Result1 = Result.Split(Convert.ToChar(";"));
						
			for(int i = 0;i<7;i++)
			{
				ParValues[i] =Result1[i];

			}
			if(connection.State == ConnectionState.Open)
			{
				connection.Dispose();
			}
		
			return ParValues;
		}
		public int Associa()
		{
					
			S_ControlsCollection CollezioneControlli=new S_ControlsCollection();			
			
			S_Controls.Collections.S_Object s_numPMS = new S_Object();
			s_numPMS.ParameterName = "p_numPMS";
			s_numPMS.DbType = CustomDBType.Integer;
			s_numPMS.Direction = ParameterDirection.Output;
			s_numPMS.Index = 0;				
			s_numPMS.Size = 50;
					
			CollezioneControlli.Add(s_numPMS);
			
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_SCHEDULA.getAssociazione_EQ_PMS";	
			int Associate = _OraDl.GetRowsAffected(CollezioneControlli, s_StrSql);			
 						
			return Associate;		
		}
	

		protected override int ExecuteUpdate(S_ControlsCollection CollezioneControlli, ExecuteType Operazione, int itemId)
		{
			return 0;
		}


	}
}
