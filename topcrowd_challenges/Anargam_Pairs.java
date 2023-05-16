package topcrowd_challenges;

import java.util.Arrays;

public class Anargam_Pairs {

	public static void main(String[] args) {
		String[] arr = { "actors", "costar", "altered", "related", "mastering", "streaming", "auctioned", "education",
				"aspired", "despair" };
		String[] arr1 = { "actors", "costar", "altered", "related", "mastering", "streaming", "auctioned", "education",
				"aspired", "despair" };
		findAnargamPairs(arr, arr1);
		String s1 = "Mallika";
		sortString(s1);
		System.out.println();
	}

	private static void findAnargamPairs(String[] arr, String[] arr1) {
		Arrays.sort(arr);
		System.out.println(Arrays.toString(arr));
		System.out.println(Arrays.toString(arr1));
		for (int i = 0; i < arr.length; i++) {
			char[] charArray = arr[i].toCharArray();
			int c = 0;
			int ind1 = 0;
			int ind2 = 0;

			Arrays.sort(charArray);
			//System.out.println(Arrays.toString(charArray));
			for (int j = 0; j < arr.length; j++) {
				for (int k = 1; k < arr.length; k++)
					if (arr[j].equals(arr[k])) {
						c++;
						ind1 = j;
						ind2 = k;

					}

				// System.out.println(arr[ind1]+"\t"+arr[ind2]);
			}
		}
	}

	public static void sortString(String s) {
		char temp = ' ';
		for (int i = 0; i < s.length(); i++) {
			char ch = s.charAt(i);
			for (int j = i + 1; j < s.length(); j++) {
				char ch1 = s.charAt(i + 1);
				if (ch > ch1) {
					temp = ch;
					ch = ch1;
					ch1 = temp;

				}
			}
		}
	}

}
