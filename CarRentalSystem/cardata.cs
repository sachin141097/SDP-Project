//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CarRentalSystem
{
    using System;
    using System.Collections.Generic;
    
    public partial class cardata
    {
        public string carno { get; set; }
        public int vehicleid { get; set; }
        public string carimage { get; set; }
        public Nullable<System.DateTime> startdate { get; set; }
        public Nullable<System.DateTime> enddate { get; set; }
        public Nullable<int> rentprice { get; set; }
        public Nullable<int> oid { get; set; }
    
        public virtual vehicle vehicle { get; set; }
    }
}
