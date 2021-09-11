using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class customersModel
    {
        public int custId { get; set; }
        public string custname { get; set; }
      //  public string custAccountName { get; set; }
        public string lastName { get; set; }
        public string company { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string mobile { get; set; }
        public string fax { get; set; }
        public string address { get; set; }
        public string custlevel { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public string custCode { get; set; }
       // public string password { get; set; }
        public string image { get; set; }
        public string notes { get; set; }
        public Nullable<decimal> balance { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }

        public bool canDelete { get; set; }
        public Nullable<int> isActive { get; set; }
        public string hashCode { get; set; }
    }
}