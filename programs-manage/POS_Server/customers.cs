//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Programs_Server
{
    using System;
    using System.Collections.Generic;
    
    public partial class customers
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public customers()
        {
            this.packageUser = new HashSet<packageUser>();
        }
    
        public int custId { get; set; }
        public string custname { get; set; }
        public string custAccountName { get; set; }
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
        public string password { get; set; }
        public string image { get; set; }
        public string notes { get; set; }
        public Nullable<decimal> balance { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public Nullable<int> isActive { get; set; }
    
        public virtual users users { get; set; }
        public virtual users users1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<packageUser> packageUser { get; set; }
    }
}