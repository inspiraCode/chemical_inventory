using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chemical_Inventory.Entities
{
    public class Chemical
    {
        public long ID = -1;
        public string ChemicalName = "";
        public string PartNumber = "";
        public string Health = "";
        public string Flammability = "";
        public string Reactivity = "";
        public string PPE = "";
        public string ExcelFile = "";
        public string ProviderFile = "";
        public string Container = "";
        public string Status = "";
        public DateTime CreateDate = DateTime.Now;
    }
}