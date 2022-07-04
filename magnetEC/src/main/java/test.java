import java.util.HashMap;
import java.util.Map;

import model.EnumProductFullName;

public class test {

	public static void main(String[] args) {
		String testname = "ND";
		String a=EnumProductFullName.valueOf(testname).getFullName();
		System.out.println(a);
	}
}
