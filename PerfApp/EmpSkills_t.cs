//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PerfApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class EmpSkills_t
    {
        public int EmpId { get; set; }
        public System.Guid RoleId { get; set; }
        public string SelfComments { get; set; }
        public string AppComments { get; set; }
        public Nullable<System.Guid> EmpSkillId { get; set; }
        public System.Guid SkillId { get; set; }
        public Nullable<int> Type { get; set; }
        public string Self_Rating { get; set; }
        public string App_Rating { get; set; }
    }
}