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
    
    public partial class packageUser
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public packageUser()
        {
            this.posSerials = new HashSet<posSerials>();
            this.payOp = new HashSet<payOp>();
        }
    
        public int packageUserId { get; set; }
        public Nullable<int> packageId { get; set; }
        public Nullable<int> userId { get; set; }
        public string packageSaleCode { get; set; }
        public string packageNumber { get; set; }
        public Nullable<int> customerId { get; set; }
        public string customerServerCode { get; set; }
        public bool isBooked { get; set; }
        public string notes { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public Nullable<System.DateTime> bookDate { get; set; }
        public Nullable<int> isActive { get; set; }
        public Nullable<System.DateTime> expireDate { get; set; }
        public Nullable<bool> isOnlineServer { get; set; }
        public Nullable<int> countryPackageId { get; set; }
        public bool canRenew { get; set; }
        public int oldPackageId { get; set; }
        public string type { get; set; }
        public bool isPayed { get; set; }
        public int salesInvCount { get; set; }
        public int monthCount { get; set; }
    
        public virtual countryPackageDate countryPackageDate { get; set; }
        public virtual customers customers { get; set; }
        public virtual packages packages { get; set; }
        public virtual users users { get; set; }
        public virtual users users1 { get; set; }
        public virtual users users2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<posSerials> posSerials { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<payOp> payOp { get; set; }
    }
}
