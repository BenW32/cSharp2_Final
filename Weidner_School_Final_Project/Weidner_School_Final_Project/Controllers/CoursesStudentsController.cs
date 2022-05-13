using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Weidner_School_Final_Project.Data;
using Weidner_School_Final_Project.Models;
using Microsoft.AspNetCore.Authorization;


namespace Weidner_School_Final_Project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CoursesStudentsController : ControllerBase
    {
        private readonly Weidner_SchoolContext _context;
        //-------------------------------
        private readonly JwtAuthenticationManager jwtAuthenticationManager;
        public CoursesStudentsController(JwtAuthenticationManager jwtAuthenticationManager, Weidner_SchoolContext context)
        {
            this.jwtAuthenticationManager = jwtAuthenticationManager;
            _context = context;
        }

        /* public CoursesStudentsController(Weidner_SchoolContext context)
         {
             _context = context;
         }*/

        // GET: api/CoursesStudents
        [Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CoursesStudent>>> GetCoursesStudents()
        {
          if (_context.CoursesStudents == null)
          {
              return NotFound();
          }
            return await _context.CoursesStudents.ToListAsync();
        }

        // GET: api/CoursesStudents/5
        [Authorize]
        [HttpGet("{id}")]
        public async Task<ActionResult<CoursesStudent>> GetCoursesStudent(int id)
        {
          if (_context.CoursesStudents == null)
          {
              return NotFound();
          }
            var coursesStudent = await _context.CoursesStudents.FindAsync(id);

            if (coursesStudent == null)
            {
                return NotFound();
            }

            return coursesStudent;
        }

        // PUT: api/CoursesStudents/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCoursesStudent(int id, CoursesStudent coursesStudent)
        {
            if (id != coursesStudent.CoursesStudentsId)
            {
                return BadRequest();
            }

            _context.Entry(coursesStudent).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CoursesStudentExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }
        [Authorize(Roles = "Student")]
        //route allows for student to register for classes 
        // POST: api/CoursesStudents
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CoursesStudent>> PostCoursesStudent(CoursesStudent coursesStudent)
        {
          if (_context.CoursesStudents == null)
          {
              return Problem("Entity set 'Weidner_SchoolContext.CoursesStudents'  is null.");
          }
            _context.CoursesStudents.Add(coursesStudent);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCoursesStudent", new { id = coursesStudent.CoursesStudentsId }, coursesStudent);
        }
        [Authorize]
        // DELETE: api/CoursesStudents/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCoursesStudent(int id)
        {
            if (_context.CoursesStudents == null)
            {
                return NotFound();
            }
            var coursesStudent = await _context.CoursesStudents.FindAsync(id);
            if (coursesStudent == null)
            {
                return NotFound();
            }

            _context.CoursesStudents.Remove(coursesStudent);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CoursesStudentExists(int id)
        {
            return (_context.CoursesStudents?.Any(e => e.CoursesStudentsId == id)).GetValueOrDefault();
        }
    }
}
