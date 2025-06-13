using Book_Management_CRUD.DTOs;
using Book_Management_CRUD.Services;
using Microsoft.AspNetCore.Mvc;

namespace Book_Management_CRUD.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MissionController : ControllerBase
    {
        private readonly MissionService _service;

        public MissionController(MissionService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<ActionResult<List<MissionReadDto>>> GetAll()
        {
            var missions = await _service.GetAllAsync();
            return Ok(missions);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<MissionReadDto>> GetById(int id)
        {
            var mission = await _service.GetByIdAsync(id);
            if (mission == null) return NotFound();
            return Ok(mission);
        }

        [HttpPost]
        public async Task<ActionResult<MissionReadDto>> Create(MissionDto dto)
        {
            var created = await _service.CreateAsync(dto);
            var result = await _service.GetByIdAsync(created.Id);

            return CreatedAtAction(nameof(GetById), new { id = created.Id }, result);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, MissionDto dto)
        {
            var updated = await _service.UpdateAsync(id, dto);
            if (!updated) return NotFound();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var deleted = await _service.DeleteAsync(id);
            if (!deleted) return NotFound();
            return NoContent();
        }
    }
}
