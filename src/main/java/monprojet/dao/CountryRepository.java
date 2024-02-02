package monprojet.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import monprojet.entity.Country;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

// This will be AUTO IMPLEMENTED by Spring 
//

public interface CountryRepository extends JpaRepository<Country, Integer> {
    @Query("SELECT SUM(city.population) FROM City city WHERE city.country.id = :countryId")
    public Integer calculPopulation(Integer countryId);

    public interface CountryPopulation {
        String getCountryName();
        Integer getPopulation();
    }

    @Query("SELECT country.name AS countryName, SUM(city.population) AS population " +
            "FROM Country country JOIN country.cities city GROUP BY country.id")
    List<CountryPopulation> getCountryPopulationList();

}
