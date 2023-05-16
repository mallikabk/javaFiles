package topcrowd_challenges;

public class SpecificOrderOfString {

	public static void main(String[] args) {
		String word = "Techie Deligeht";
		String pattern = "ei";
		String output = findPattern(word, pattern);
		System.out.println(output);
	}

	private static String findPattern(String word, String pattern) {
		String result = "";
		int c = 0;
		for (int i = 0; i < word.length(); i++) {
			for (int j = i + 1; j < word.length(); j++) {
				String res_string = word.substring(i, j);
				char ch = pattern.charAt(0);

				String rem = word.substring(i + 1, word.length());

				if (res_string.equals(pattern)) {
					c++;

				}
			}
		}
		if (c > 0) {
			result = "pattern Found...!";

		} else {
			result = "pattern not found...!";
		}
		return result;
	}

}
