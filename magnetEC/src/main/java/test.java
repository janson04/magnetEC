import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class test {

	public static void main(String[] args) {

		List<String> alpha = new ArrayList<>(Arrays.asList("a", "b", "c", "d"));

		List<Boolean> collect2 = alpha.stream().map(x->x.contains("a")).collect(Collectors.toList());
		System.out.println(collect2); 		// [true, false, false, false]
		
		List<String> collect3 = alpha.stream().map(x->{
			if(x.contains("a")) {
				return x;
			}
			return null;
		}).collect(Collectors.toList());
		System.out.println(collect3);
		
		// Before Java8
		List<String> alphaUpper = new ArrayList<>();
		for (String s : alpha) {
			alphaUpper.add(s.toUpperCase());
		}

		System.out.println(alpha); 		// [a, b, c, d]
		System.out.println(alphaUpper); // [A, B, C, D]

		// Java 8
		List<String> collect = alpha.stream().map(String::toUpperCase).collect(Collectors.toList());
		System.out.println(collect); 	// [A, B, C, D]

		// Extra, streams apply to any data type.
		List<Integer> num = Arrays.asList(1, 2, 3, 4, 5);
		List<Integer> collect1 = num.stream().map(n -> n * 2).collect(Collectors.toList());
		System.out.println(collect1); 	// [2, 4, 6, 8, 10]

		
		
	}

}


