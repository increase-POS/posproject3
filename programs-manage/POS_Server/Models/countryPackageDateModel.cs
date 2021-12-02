using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class countryPackageDateModel
    {
        public int Id { get; set; }
        public Nullable<int> countryId { get; set; }
        public Nullable<int> packageId { get; set; }
        public int monthCount { get; set; }
        public int yearCount { get; set; }
        public Nullable<decimal> price { get; set; }
        public string notes { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public bool islimitDate { get; set; }
        public Nullable<int> isActive { get; set; }
        public bool canDelete { get; set; }
        
    }
}