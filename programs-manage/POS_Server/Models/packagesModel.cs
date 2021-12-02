using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class packagesModel
    {
        public int packageId { get; set; }
        public string packageName { get; set; }
        public string details { get; set; }
        public int branchCount { get; set; }
        public int posCount { get; set; }
        public int userCount { get; set; }
        public int vendorCount { get; set; }
        public int customerCount { get; set; }
        public int itemCount { get; set; }
        public int salesInvCount { get; set; }
        public Nullable<int> programId { get; set; }
        public string programName { get; set; }
        public Nullable<int> verId { get; set; }
        public string verName { get; set; }

        public int isActive { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public string packageCode { get; set; }
        public int storeCount { get; set; }
       

        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public bool canDelete { get; set; }
        public string notes { get; set; }


    }




    









}