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
    
    public partial class countryPackageDate
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public countryPackageDate()
        {
            this.packageUser = new HashSet<packageUser>();
        }
    
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
    
        public virtual countriesCodes countriesCodes { get; set; }
        public virtual packages packages { get; set; }
        public virtual users users { get; set; }
        public virtual users users1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<packageUser> packageUser { get; set; }
    }
}
