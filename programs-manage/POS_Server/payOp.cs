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
    
    public partial class payOp
    {
        public int payOpId { get; set; }
        public decimal Price { get; set; }
        public string code { get; set; }
        public string type { get; set; }
        public Nullable<int> packageUserId { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public string notes { get; set; }
        public decimal discountValue { get; set; }
        public Nullable<int> agentId { get; set; }
        public Nullable<int> customerId { get; set; }
        public Nullable<int> countryPackageId { get; set; }
        public decimal totalnet { get; set; }
        public Nullable<int> packageId { get; set; }
        public Nullable<System.DateTime> expireDate { get; set; }
    
        public virtual countryPackageDate countryPackageDate { get; set; }
        public virtual customers customers { get; set; }
        public virtual packages packages { get; set; }
        public virtual packageUser packageUser { get; set; }
        public virtual users users { get; set; }
        public virtual users users1 { get; set; }
        public virtual users users2 { get; set; }
    }
}
