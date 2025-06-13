using Microsoft.AspNetCore.Mvc;
using Book_Management_CRUD.Services;
using Book_Management_CRUD.DTOs;

namespace Book_Management_CRUD.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class LocationController : ControllerBase
    {
        private readonly LocationService _locationService;

        public LocationController(LocationService locationService)
        {
            _locationService = locationService;
        }

        [HttpGet("countries")]
        public ActionResult<List<CountryDto>> GetCountries()
        {
            var countries = _locationService.GetAllCountries();
            return Ok(countries);
        }

        [HttpGet("cities/{countryId}")]
        public ActionResult<List<CityDto>> GetCitiesByCountry(int countryId)
        {
            var cities = _locationService.GetCitiesByCountryId(countryId);
            return Ok(cities);
        }
    }
}
