package topcrowd_challenges;

import java.util.Arrays;

public class FindRank {
	public static void findRank(int[] arr, int[] arr1) {
		Arrays.sort(arr1);

		int[] temp = new int[arr.length];
		int k = 0;
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr1.length; j++) {
				if (arr[i] == arr1[j]) {
					temp[k] = j + 1;
					k++;
				}
			}
		}
		System.out.println("Output :" + Arrays.toString(temp));
	}

	public static void main(String[] args) {
		int[] array1 = { 10, 8, 15, 12, 6, 20, 1 };
		int[] sarray = { 10, 8, 15, 12, 6, 20, 1 };

		findRank(array1, sarray);
	}

}
