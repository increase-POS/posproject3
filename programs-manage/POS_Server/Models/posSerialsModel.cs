using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class posSerialsModel
    {
        public int serialId { get; set; }
        public string serial { get; set; }
        public string posDeviceCode { get; set; }
        public Nullable<int> packageUserId { get; set; }
        public int isBooked { get; set; }
        public int isActive { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public string apikey { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public bool canDelete { get; set; }
        public string notes { get; set; }

    }
}