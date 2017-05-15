//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WardrobeProject.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Article
    {
        public int ArticleID { get; set; }
        public string ArticleName { get; set; }
        public string ArticleImage { get; set; }
        public string ArticleType { get; set; }
        public int ClothingTypeID { get; set; }
        public int OccasionID { get; set; }
        public int SeasonID { get; set; }
        public int ColorID { get; set; }
    
        public virtual ClothingType ClothingType { get; set; }
        public virtual Color Color { get; set; }
        public virtual Occasion Occasion { get; set; }
        public virtual Season Season { get; set; }
    }
}
