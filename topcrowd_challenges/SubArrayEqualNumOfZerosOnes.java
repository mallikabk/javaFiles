package topcrowd_challenges;

import java.util.Arrays;

public class SubArrayEqualNumOfZerosOnes {

	static void findLargetSubArray(int a[]) {
		int maxCount = 0;
		for (int i = 0; i < a.length; i++) {
			int countOfZero = 0, countOfOne = 0;
			for (int j = i; j < a.length; j++) {
				if (a[j] == 0)
					countOfZero++;
				else
					countOfOne++;
				if (countOfOne == countOfZero) {
					if (j - i + 1 > maxCount)
						maxCount = 2 * countOfOne;
				}
			}
		}
		for (int i = 0; i < a.length; i++) {
			int countOfZero = 0, countOfOne = 0;
			for (int j = i; j < a.length; j++) {
				if (a[j] == 0)
					countOfZero++;
				else
					countOfOne++;
				if (countOfOne == countOfZero && j - i + 1 == maxCount) {
					System.out.println(Arrays.toString(Arrays.copyOfRange(a, i, j + 1)));

				}
			}
		}

	}

	public static void main(String[] args) {
		int a[] = { 0, 0, 1, 0, 1, 0, 0 };
		findLargetSubArray(a);
	}
}
