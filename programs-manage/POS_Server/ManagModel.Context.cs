﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class incprogramsdbEntities : DbContext
    {
        public incprogramsdbEntities()
            : base("name=incprogramsdbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<agentPackage> agentPackage { get; set; }
        public virtual DbSet<cities> cities { get; set; }
        public virtual DbSet<countriesCodes> countriesCodes { get; set; }
        public virtual DbSet<countryPackageDate> countryPackageDate { get; set; }
        public virtual DbSet<customers> customers { get; set; }
        public virtual DbSet<error> error { get; set; }
        public virtual DbSet<groupObject> groupObject { get; set; }
        public virtual DbSet<groups> groups { get; set; }
        public virtual DbSet<objects> objects { get; set; }
        public virtual DbSet<packages> packages { get; set; }
        public virtual DbSet<packageUser> packageUser { get; set; }
        public virtual DbSet<posSerials> posSerials { get; set; }
        public virtual DbSet<programs> programs { get; set; }
        public virtual DbSet<users> users { get; set; }
        public virtual DbSet<versions> versions { get; set; }
        public virtual DbSet<agentCustomer> agentCustomer { get; set; }
        public virtual DbSet<payOp> payOp { get; set; }
        public virtual DbSet<puStatus> puStatus { get; set; }
        public virtual DbSet<posInfo> posInfo { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
    }
}
