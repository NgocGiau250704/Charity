//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Charity.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DuAn
    {
        public int IDduan { get; set; }
        public string ProjectName { get; set; }
        public Nullable<System.DateTime> datebegin { get; set; }
        public string meta { get; set; }
        public Nullable<bool> hide { get; set; }
        public Nullable<int> order { get; set; }
        public Nullable<bool> ProjectState { get; set; }
        public Nullable<int> TotalMoney { get; set; }
        public Nullable<int> QRcode { get; set; }
        public string Infor { get; set; }
        public string Situation { get; set; }
        public string ProjectImage { get; set; }
        public string Result { get; set; }
        public string WayToSupport { get; set; }
    }
}
