package topcrowd_challenges;

public class Max_Difference {
	private static void findMaxDifference(int[] arr) {
		int maxDifference = 0;
		int index1 = 0;
		int index2 = 0;
		for (int i = 0; i < arr.length; i++) {
			int difference = 0;
			for (int j = i + 1; j < arr.length; j++) {
				difference = arr[j] - arr[i];
				if (difference > maxDifference) {
					maxDifference = difference;
					index1 = i;
					index2 = j;
				}

			}

		}
		System.out.println("Max difference is : "+ maxDifference);
		System.out.println("The pair is  : ("+arr[index1] +" , "+arr[index2]+" ) ");

	}

	public static void main(String[] args) {
		int[] arr = { 2, 7, 11, 5, 1, 3, 5 };
		findMaxDifference(arr);

	}

}
