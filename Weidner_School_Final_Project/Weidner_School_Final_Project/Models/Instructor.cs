﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Weidner_School_Final_Project.Models
{
    public partial class Instructor
    {
        public Instructor()
        {
            Courses = new HashSet<Course>();
        }

        public int InstructorId { get; set; }
        public string InstructorFirstname { get; set; }
        public string InstructorLastname { get; set; }
        public string InstructorPassword { get; set; }
        public string InstructorPhone { get; set; }
        public string InstructorEmail { get; set; }
        public string InstructorAddress { get; set; }

        public virtual ICollection<Course> Courses { get; set; }
    }
}