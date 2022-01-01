using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class BookStsModel
    {
        public int packageUserId { get; set; }
        public Nullable<int> packageId { get; set; }
        public Nullable<int> userId { get; set; }
        public string packageSaleCode { get; set; }
        public string packageNumber { get; set; }
        public Nullable<int> customerId { get; set; }
        public string customerServerCode { get; set; }

        public string notes { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }

        public bool canDelete { get; set; }
        public string userName { get; set; }
        public string userLastName { get; set; }
        public string customerName { get; set; }
        public string customerLastName { get; set; }
        public Nullable<int> countryPackageId { get; set; }
        public bool canRenew { get; set; }

        public int oldPackageId { get; set; }


        public int monthCount { get; set; }


        public Nullable<int> oldCountryPackageId { get; set; }

        public string packageName { get; set; }

        public Nullable<decimal> price { get; set; }
        public string currency { get; set; }
        public string programName { get; set; }
        public string verName { get; set; }
        public int branchCount { get; set; }
        public int programId { get; set; }
        public int verId { get; set; }
        public int totalsalesInvCount { get; set; }



        public bool isBooked { get; set; }


        public Nullable<System.DateTime> bookDate { get; set; }
        public Nullable<int> isActive { get; set; }
        public Nullable<System.DateTime> expireDate { get; set; }
        public Nullable<bool> isOnlineServer { get; set; }


        public string type { get; set; }
        public bool isPayed { get; set; }
        public int salesInvCount { get; set; }

        public Nullable<System.DateTime> activatedate { get; set; }
        public bool isServerActivated { get; set; }
        public bool islimitDate { get; set; }

        //agent
        public string agentName { get; set; }
        public string agentAccountName { get; set; }
        public string agentLastName { get; set; }
        public string agentCompany { get; set; }
        public string agentType { get; set; }

        // updateUser
        public string UPUsrName { get; set; }
        public string UPUsrAccountName { get; set; }
        public string UPUsrLastName { get; set; }
        public string UPUsrCompany { get; set; }
        public string UPUsrType { get; set; }
        //countries
        public string countryName { get; set; }
    }

}