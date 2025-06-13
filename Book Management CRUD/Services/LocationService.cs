using Book_Management_CRUD.Data;
using Book_Management_CRUD.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Book_Management_CRUD.Services
{
    public class LocationService
    {
        private readonly BookContext _context;

        public LocationService(BookContext context)
        {
            _context = context;
        }

        public List<CountryDto> GetAllCountries()
        {
            return _context.Countries
                .Where(c => c.IsActive)
                .Select(c => new CountryDto
                {
                    Id = c.Id,
                    Name = c.Name
                })
                .ToList();
        }

        public List<CityDto> GetCitiesByCountryId(int countryId)
        {
            return _context.Cities
                .Where(c => c.IsActive && c.CountryId == countryId)
                .Select(c => new CityDto
                {
                    Id = c.Id,
                    Name = c.Name,
                    CountryId = c.CountryId
                })
                .ToList();
        }
    }
}
