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
    
    public partial class packages
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public packages()
        {
            this.packageUser = new HashSet<packageUser>();
        }
    
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
        public Nullable<int> verId { get; set; }
        public Nullable<decimal> price { get; set; }
        public int isActive { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public string packageCode { get; set; }
        public Nullable<int> storeCount { get; set; }
        public Nullable<System.DateTime> endDate { get; set; }
        public int islimitDate { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
    
        public virtual programs programs { get; set; }
        public virtual users users { get; set; }
        public virtual users users1 { get; set; }
        public virtual versions versions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<packageUser> packageUser { get; set; }
    }
}
