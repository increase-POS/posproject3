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
    
    public partial class posInfo
    {
        public int posInfoId { get; set; }
        public string posName { get; set; }
        public string branchName { get; set; }
        public string posDeviceCode { get; set; }
        public Nullable<bool> isBooked { get; set; }
        public Nullable<int> isActive { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public Nullable<int> createUserId { get; set; }
        public Nullable<int> updateUserId { get; set; }
        public string notes { get; set; }
        public Nullable<int> serialId { get; set; }
        public Nullable<int> posSettingId { get; set; }
        public Nullable<int> posId { get; set; }
    
        public virtual posSerials posSerials { get; set; }
    }
}
