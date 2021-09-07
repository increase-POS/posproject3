﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class programsModel
    {
        public int programId { get; set; }
        public string name { get; set; }
        public string details { get; set; }
        public string notes { get; set; }
        public int isActive { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public string programCode { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
     
        public bool canDelete { get; set; }
    
    }
}