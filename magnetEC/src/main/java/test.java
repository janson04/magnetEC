
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class test {
	public static void main(String[] args) {
		
		List<Country> couList = Arrays.asList(
		        new Country("Egypt", Country.Continent.Africa),
		        new Country("Japan", Country.Continent.ASIA),
		        new Country("Germany", Country.Continent.EUROPE),
		        new Country("Italy", Country.Continent.EUROPE));
		Map<Country.Continent, List<String>> regionNames = couList.stream().
		            collect(
		            		Collectors.groupingBy(
		            				Country::getRegion,
		            				Collectors.mapping(
		            						Country::getName, Collectors.toList()
		            						)
			                )
		            	);
		System.out.println(regionNames.getClass().getSimpleName());
		System.out.println(regionNames);
		
		System.out.println("EUROPE".hashCode());
		System.out.println("ASIA".hashCode());
		System.out.println("Africa".hashCode());
	}
}

class Country {
    public enum Continent {
        ASIA, EUROPE, Africa
    }
    String name;
    Continent region;
    public Country(String na, Continent reg) {
        name = na;
        region = reg;
    }
    public String getName() {
        return name;
    }
    public Continent getRegion() {
        return region;
    }
}