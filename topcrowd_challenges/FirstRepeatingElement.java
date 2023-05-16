package topcrowd_challenges;

public class FirstRepeatingElement {

	public static void main(String[] args) {
		int arr[] = { 1, 5, 3, 4, 3, 5, 6 };

		int n = arr.length;
		int firstRepeatedElePosition = findRepeatingElement(arr, n);
		System.out.println("OUTPUT : " + firstRepeatedElePosition);

	}
//finding position of first repeating element
	private static int findRepeatingElement(int[] arr, int n) {

		int index = 0;
		for (int i = 0; i < n; i++) {
			int count = 0;
			for (int j = i + 1; j < n; j++) {
				if (arr[i] == arr[j]) {
					count++;
					if (count == 1) {
						index = i + 1;

						return i + 1;

					}
				}
			}
		}
		return -1;

	}
}
