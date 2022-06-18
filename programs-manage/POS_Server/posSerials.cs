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
    
    public partial class posSerials
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public posSerials()
        {
            this.posInfo = new HashSet<posInfo>();
        }
    
        public int serialId { get; set; }
        public string serial { get; set; }
        public string posDeviceCode { get; set; }
        public Nullable<int> packageUserId { get; set; }
        public Nullable<bool> isBooked { get; set; }
        public Nullable<int> isActive { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public string notes { get; set; }
        public bool unLimited { get; set; }
    
        public virtual packageUser packageUser { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<posInfo> posInfo { get; set; }
        public virtual users users { get; set; }
        public virtual users users1 { get; set; }
    }
}
