using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Chemical_Inventory.Entities;

namespace Chemical_Inventory.DAO
{
    public class ChemicalCRUD
    {

        ConnectionManager connectionManager = new ConnectionManager();
        Data_Base_MNG.SQL DM;

        public bool ErrorOccur = false;
        public string ErrorMessage = "";

        public ChemicalCRUD()
        { }

        #region ICRUD<Chemical> Members

        public bool create(Chemical entity)
        {
            ErrorOccur = false;
            bool result = false;
            //DM = connectionManager.getDataManager();
            //try
            //{
            //    DM.Load_SP_Parameters("@ChemicalCode", entity.ChemicalCode);
            //    DM.Load_SP_Parameters("@Chemical", entity.CommidityName);

            //    result = DM.Execute_StoreProcedure("ChemicalMaster_NewChemical", true);

            //    ErrorOccur = DM.ErrorOccur;
            //    ErrorMessage = DM.Error_Mjs;
            //}
            //catch (Exception e)
            //{
            //    ErrorOccur = true;
            //    ErrorMessage = e.Message;
            //    return false;
            //}

            return result;
        }

        public string createAndReturnIdGenerated(Chemical entity)
        {
            ErrorOccur = false;
            string idGenerated = "";
            //DM = connectionManager.getDataManager();
            //try
            //{
            //    DM.Load_SP_Parameters("@ChemicalCode", entity.ChemicalCode);
            //    DM.Load_SP_Parameters("@Chemical", entity.CommidityName);

            //    idGenerated = DM.Execute_StoreProcedure_Scalar("ChemicalMaster_NewChemical", true);

            //    ErrorOccur = DM.ErrorOccur;
            //    ErrorMessage = DM.Error_Mjs;
            //}
            //catch (Exception e)
            //{
            //    ErrorOccur = true;
            //    ErrorMessage = e.Message;
            //    return "";
            //}

            return idGenerated;
        }


        public string createAndReturnIdGenerated(Chemical entity, ref Data_Base_MNG.SQL DM)
        {
            ErrorOccur = false;
            string idGenerated = "";
            //try
            //{
            //    DM.Load_SP_Parameters("@ChemicalCode", entity.ChemicalCode);
            //    DM.Load_SP_Parameters("@Chemical", entity.CommidityName);

            //    idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("ChemicalMaster_NewChemical", true);

            //    ErrorOccur = DM.ErrorOccur;
            //    ErrorMessage = DM.Error_Mjs;
            //}
            //catch (Exception e)
            //{
            //    ErrorOccur = true;
            //    ErrorMessage = e.Message;
            //    return "";
            //}

            return idGenerated;
        }
        public Chemical readById(long id)
        {
            Chemical chemical = new Chemical();

            //string query = "SELECT      ChemicalKey, ChemicalCode, Chemical " +
            //                "FROM       ChemicalMaster " +
            //                "WHERE      (ChemicalKey = @key)";
            //DataTable table = new DataTable();
            //SqlConnection sqlConnection = connectionManager.getConnection();
            //if (sqlConnection != null)
            //{
            //    SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            //    sqlCommand.Parameters.AddWithValue("@key",id);
            //    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            //    sqlDataAdapter.Fill(table);

            //    if(table.Rows.Count > 0){
            //        chemical.Id = long.Parse(table.Rows[0][0].ToString());
            //        chemical.ChemicalCode = table.Rows[0][1].ToString();
            //        chemical.CommidityName = table.Rows[0][2].ToString();

            //        sqlConnection.Dispose();
            //        return chemical;
            //    }
            //}
            return null;
        }

        public IList<Chemical> readAll()
        {
            List<Chemical> recordset = new List<Chemical>();
            recordset.Clear();
            DM = connectionManager.getDataManager();

            //string query = "SELECT      ChemicalKey, ChemicalCode, Chemical " +
            //                "FROM       ChemicalMaster ORDER BY Chemical";

            //DataTable table = new DataTable();
            //table = DM.Execute_Query(query);

            //for (int i = 0; i < table.Rows.Count; i++)
            //{
            //    Chemical chemical = new Chemical();
            //    chemical.Id = long.Parse(table.Rows[i][0].ToString());
            //    chemical.ChemicalCode = table.Rows[i][1].ToString();
            //    chemical.CommidityName = table.Rows[i][2].ToString();

            //    recordset.Add(chemical);
            //}

            for (long i = 0; i < 50; i++)
            {
                Chemical chemical = new Chemical();
                chemical.ID = i;
                chemical.ChemicalName = "Name " + i;
                chemical.PartNumber = "Part Number " + i;
                chemical.CreateDate = DateTime.Now.AddDays(i).ToString();
                recordset.Add(chemical);
            }

            return recordset;
        }

        public bool update(Chemical entity)
        {
            ErrorOccur = false;
            bool result = false;
            //DM = connectionManager.getDataManager();
            //try
            //{
            //    DM.Load_SP_Parameters("@ItemMasterKey", entity.Id.ToString());
            //    DM.Load_SP_Parameters("@ChemicalCode", entity.ChemicalCode);
            //    DM.Load_SP_Parameters("@Chemical", entity.CommidityName);

            //    result = DM.Execute_StoreProcedure("ChemicalMaster_EditChemical", true);

            //    ErrorOccur = DM.ErrorOccur;
            //    ErrorMessage = DM.Error_Mjs;
            //}
            //catch (Exception e)
            //{
            //    ErrorOccur = true;
            //    ErrorMessage = e.Message;
            //    return false;
            //}

            return result;
        }
        public bool update(Chemical entity, ref Data_Base_MNG.SQL DM)
        {
            ErrorOccur = false;
            bool result = false;
            //try
            //{
            //    DM.Load_SP_Parameters("@ItemMasterKey", entity.Id.ToString());
            //    DM.Load_SP_Parameters("@ChemicalCode", entity.ChemicalCode);
            //    DM.Load_SP_Parameters("@Chemical", entity.CommidityName);

            //    result = DM.Execute_StoreProcedure_Open_Conn("ChemicalMaster_EditChemical", true);

            //    ErrorOccur = DM.ErrorOccur;
            //    ErrorMessage = DM.Error_Mjs;
            //}
            //catch (Exception e)
            //{
            //    ErrorOccur = true;
            //    ErrorMessage = e.Message;
            //    return false;
            //}

            return result;
        }
        public bool delete(long id)
        {
            ErrorOccur = false;
            int rowsAffected = 0;
            //string query = "DELETE FROM Chemical WHERE ChemicalKey=@key";
            //SqlConnection sqlConnection = connectionManager.getConnection();
            //SqlCommand sqlCommand = null;
            //if (sqlConnection != null)
            //{
            //    try
            //    {
            //        sqlCommand = new SqlCommand(query, sqlConnection);
            //        sqlCommand.Parameters.AddWithValue("@key", id);
            //        sqlConnection.Open();
            //        rowsAffected = sqlCommand.ExecuteNonQuery();
            //        if (rowsAffected > 0)
            //        {
            //            return true;
            //        }
            //        else
            //        {
            //            ErrorOccur = true;
            //            ErrorMessage = "There were no rows affected for table: Chemical.";
            //            return true;
            //        }
            //    }
            //    catch (Exception e)
            //    {
            //        ErrorOccur = true;
            //        ErrorMessage = e.Message;
            //        //using return false below
            //    }
            //    finally
            //    {
            //        sqlConnection.Dispose();
            //        sqlCommand.Dispose();               
            //    }           
            //}
            //else
            //{
            //    ErrorOccur = true;
            //    ErrorMessage = "Error. Could not connect to database.";
            //}
            return false;
        }

        #endregion
    }
}