using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class payOpModel
    {
        public int payOpId { get; set; }
        public decimal Price { get; set; }
        public string code { get; set; }
        public string type { get; set; }
        public Nullable<int> packageUserId { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public string notes { get; set; }
        public bool canDelete { get; set; }
        public decimal discountValue { get; set; }
        public Nullable<int> agentId { get; set; }
        public Nullable<int> customerId { get; set; }
        public Nullable<int> countryPackageId { get; set; }
        public decimal totalnet { get; set; }//paid
        public Nullable<int> packageId { get; set; }

        public string packageNumber { get; set; }//bookNum
        public Nullable<System.DateTime> expireDate { get; set; }//expireDate


    }
}