package topcrowd_challenges;

public class LongestSubstring {

	public static void main(String[] args) {
		String str="abbcdafeegh";
		findLongestSubstring(str);

	}

	private static void findLongestSubstring(String str) {
		String res_string="";
		int c=0;
		for(int i=0;i<str.length()-1;i++) {
			if(str.charAt(i)!=str.charAt(i+1)) {
				res_string+=str.charAt(i);
				c++;
			}
			if(str.charAt(i)==str.charAt(i+1)) {
				
				System.out.println(res_string);
			}
			
		
		}
	}

}
