using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Chemical_Inventory.DAO;
using Chemical_Inventory.Entities;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace Chemical_Inventory.WebServices
{
    public partial class Catalogs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["cmd"] == null)
                return;

            string cmd = Request["cmd"].ToString();
            string catalog = Request["catalog"];

            switch (cmd)
            {
                case "read":
                    if (catalog != null)
                    {
                        switch (catalog)
                        {
                            case "chemicals":
                                Response.Clear();
                                Response.Write(getChemicals());
                                Response.End();
                                return;
                        }
                    }
                    return;
                case "downloadExcelFile":
                    downloadExcelFile();
                return;
                case "downloadProviderFile":
                    downloadProviderFile();
                return;
                //case "create":
                //    if (catalog != null)
                //    {
                //        switch (catalog)
                //        {
                //            case "chemical":
                //                Response.Clear();
                //                Response.Write(createChemical());
                //                Response.End();
                //                return;

                //        }
            }
            return;
        }

        private string getChemicals()
        {
            ChemicalCRUD commodity_CRUD = new ChemicalCRUD();
            List<Chemical> listChemicals = (List<Chemical>)commodity_CRUD.readAll();

            return JsonConvert.SerializeObject(listChemicals);
        }

        public void downloadExcelFile()
        {
            Response.AddHeader("Content-Disposition", "attachment;filename=ExcelSample.xlsx");
            Response.TransmitFile(ResolveUrl("/Demo Files/ExcelFile.xlsx"));
            Response.End();
        }

        public void downloadProviderFile()
        {
            Response.AddHeader("Content-Disposition", "attachment;filename=PDFSample.pdf");
            Response.TransmitFile(ResolveUrl("/Demo Files/PDFFile.pdf"));
            Response.End();
        }

        //public string createChemical()
        //{
        //    Chemical resultChemical = new Chemical();
        //    GatewayResponse response = new GatewayResponse();
        //    String s;
        //    try
        //    {
        //        s = new StreamReader(Request.InputStream).ReadToEnd();
        //        resultChemical = JsonConvert.DeserializeObject<Chemical>(s);
        //    }
        //    catch (Exception ex)
        //    {
        //        response.ErrorThrown = true;
        //        response.ResponseDescription = "ERROR: When trying to parse JSON in server. " + ex.Message;
        //        return JsonConvert.SerializeObject(response);
        //    }

        //    ChemicalCRUD supplierCRUD = new ChemicalCRUD();
        //    string idGenerated = supplierCRUD.createAndReturnIdGenerated(resultChemical);
        //    if (supplierCRUD.ErrorOccur)
        //    {
        //        response.ErrorThrown = true;
        //        response.ResponseDescription = "ERROR: " + supplierCRUD.ErrorMessage;
        //        return JsonConvert.SerializeObject(response);
        //    }

        //    resultChemical.Id = long.Parse(idGenerated);
        //    response.ErrorThrown = false;
        //    response.ResponseDescription = "Chemical created successfully.";
        //    response.Result = resultChemical;
        //    return JsonConvert.SerializeObject(response);
        //}

    }
}