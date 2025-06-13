using Book_Management_CRUD.Models;
using Book_Management_CRUD.Services;
using Microsoft.AspNetCore.Mvc;

namespace Book_Management_CRUD.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MissionThemeController : ControllerBase
    {
        private readonly MissionThemeService _service;

        public MissionThemeController(MissionThemeService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<ActionResult<List<MissionTheme>>> GetAll()
        {
            return Ok(await _service.GetAllAsync());
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<MissionTheme>> GetById(int id)
        {
            var theme = await _service.GetByIdAsync(id);
            if (theme == null) return NotFound();
            return Ok(theme);
        }

        [HttpPost]
        public async Task<ActionResult<MissionTheme>> Create(MissionTheme theme)
        {
            var created = await _service.CreateAsync(theme);
            return CreatedAtAction(nameof(GetById), new { id = created.MissionThemeId }, created);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, MissionTheme theme)
        {
            var updated = await _service.UpdateAsync(id, theme);
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
