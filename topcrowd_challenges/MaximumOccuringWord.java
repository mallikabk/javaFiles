package topcrowd_challenges;

import java.util.Arrays;

public class MaximumOccuringWord {

	public static void main(String[] args) {
		String[] arr = { "code", "coder", "coding", "codable", "codec", "codecs", "coded", "codeless", "codec",
				"codecs", "codependence", "codex", "codify", "codependents", "codes", "code", "coder", "codesign",
				"codec", "codeveloper", "codrive", "codec", "codecs", "codiscovered" };

		String[] arr1 = new String[arr.length+1];
		for (int i = 0; i < arr.length - 1; i++) {
			int c = 0;
			for (int j = i + 1; j < arr.length; j++) {
				int k = 0;
				if (!arr[i].equals(arr[j])) {
					c++;
					arr[k] = arr[i];
					k++;
				}
			}

		}
		System.out.println(Arrays.toString(arr1));
	}

}
