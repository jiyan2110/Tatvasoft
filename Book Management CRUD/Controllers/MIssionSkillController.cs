using Microsoft.AspNetCore.Mvc;
using Book_Management_CRUD.Models;
using Book_Management_CRUD.Services;

namespace Book_Management_CRUD.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MissionSkillController : ControllerBase
    {
        private readonly MissionSkillService _missionSkillService;

        public MissionSkillController(MissionSkillService missionSkillService)
        {
            _missionSkillService = missionSkillService;
        }

        // GET: api/MissionSkill
        [HttpGet]
        public async Task<ActionResult<List<MissionSkill>>> GetAll()
        {
            var skills = await _missionSkillService.GetAllMissionSkillsAsync();
            return Ok(skills);
        }

        // GET: api/MissionSkill/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MissionSkill>> GetById(int id)
        {
            var skill = await _missionSkillService.GetMissionSkillByIdAsync(id);
            if (skill == null)
                return NotFound();

            return Ok(skill);
        }

        // POST: api/MissionSkill
        [HttpPost]
        public async Task<ActionResult<MissionSkill>> Create(MissionSkill newSkill)
        {
            var createdSkill = await _missionSkillService.AddMissionSkillAsync(newSkill);
            return CreatedAtAction(nameof(GetById), new { id = createdSkill.Id }, createdSkill);
        }

        // PUT: api/MissionSkill/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, MissionSkill updatedSkill)
        {
            var result = await _missionSkillService.UpdateMissionSkillAsync(id, updatedSkill);
            if (!result)
                return NotFound();

            return NoContent();
        }

        // DELETE: api/MissionSkill/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var result = await _missionSkillService.DeleteMissionSkillAsync(id);
            if (!result)
                return NotFound();

            return NoContent();
        }
    }
}
