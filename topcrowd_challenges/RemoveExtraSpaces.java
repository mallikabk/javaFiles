package topcrowd_challenges;

public class RemoveExtraSpaces {
	

		public static void main(String[] args) {
			String str = " Hi I#@  ,;:/ am+* a Java Deve,loper.-'";
			String res = "";
			for (int i = 0; i < str.length(); i++) {
				char ch = str.charAt(i);
				if (ch != ' ' && ((int) ch >= 48) && ((int) ch <= 57) || ((int) ch >= 65) && ((int) ch <= 90)
						|| ((int) ch >= 97 && (int) ch <= 122)) {
					res += ch;
				}

			}
			System.out.println(res);
		
	}
}
