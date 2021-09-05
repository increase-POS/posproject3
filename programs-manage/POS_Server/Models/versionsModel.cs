using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class versionsModel
    {
        public int verId { get; set; }
        public string name { get; set; }
        public string details { get; set; }
        public int isActive { get; set; }
        public string versionscode { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public Nullable<int> programId { get; set; }
        public bool canDelete { get; set; }
        public string notes { get; set; }

    }
}