//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Game_tracker_project1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Team
    {
        public int TeamID { get; set; }
        public int GameID { get; set; }
        public string TeamName { get; set; }
        public int TeamScore { get; set; }
        public string TeamDesc { get; set; }
        public int TeamNo { get; set; }
    
        public virtual Game Game { get; set; }
    }
}
