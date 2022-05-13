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
    public class AssignmentsStudentsController : ControllerBase
    {
        private readonly Weidner_SchoolContext _context;

        //adding code 
        private readonly JwtAuthenticationManager jwtAuthenticationManager;
        public AssignmentsStudentsController(JwtAuthenticationManager jwtAuthenticationManager, Weidner_SchoolContext context)
        {
            this.jwtAuthenticationManager = jwtAuthenticationManager;
            _context = context;
        }
        //-------------------------

        /*public AssignmentsStudentsController(Weidner_SchoolContext context)
        {
            _context = context;
        }*/

        // GET: api/AssignmentsStudents
        [Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<AssignmentsStudent>>> GetAssignmentsStudents()
        {
          if (_context.AssignmentsStudents == null)
          {
              return NotFound();
          }
            return await _context.AssignmentsStudents.ToListAsync();
        }

        // GET: api/AssignmentsStudents/5
        [Authorize]
        [HttpGet("{id}")]
        public async Task<ActionResult<AssignmentsStudent>> GetAssignmentsStudent(int id)
        {
          if (_context.AssignmentsStudents == null)
          {
              return NotFound();
          }
            var assignmentsStudent = await _context.AssignmentsStudents.FindAsync(id);

            if (assignmentsStudent == null)
            {
                return NotFound();
            }

            return assignmentsStudent;
        }

        // PUT: api/AssignmentsStudents/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAssignmentsStudent(int id, AssignmentsStudent assignmentsStudent)
        {
            if (id != assignmentsStudent.AssignmentsStudentsId)
            {
                return BadRequest();
            }

            _context.Entry(assignmentsStudent).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AssignmentsStudentExists(id))
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

        // POST: api/AssignmentsStudents
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPost]
        public async Task<ActionResult<AssignmentsStudent>> PostAssignmentsStudent(AssignmentsStudent assignmentsStudent)
        {
          if (_context.AssignmentsStudents == null)
          {
              return Problem("Entity set 'Weidner_SchoolContext.AssignmentsStudents'  is null.");
          }
            _context.AssignmentsStudents.Add(assignmentsStudent);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAssignmentsStudent", new { id = assignmentsStudent.AssignmentsStudentsId }, assignmentsStudent);
        }

        // DELETE: api/AssignmentsStudents/5
        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAssignmentsStudent(int id)
        {
            if (_context.AssignmentsStudents == null)
            {
                return NotFound();
            }
            var assignmentsStudent = await _context.AssignmentsStudents.FindAsync(id);
            if (assignmentsStudent == null)
            {
                return NotFound();
            }

            _context.AssignmentsStudents.Remove(assignmentsStudent);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool AssignmentsStudentExists(int id)
        {
            return (_context.AssignmentsStudents?.Any(e => e.AssignmentsStudentsId == id)).GetValueOrDefault();
        }
    }
}
