//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Group3_iCareAPP.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class iCareWorker
    {
        public int UserID { get; set; }
        public string Profession { get; set; }
        public string Type { get; set; }
    
        public virtual iCareUser iCareUser { get; set; }
    }
}
