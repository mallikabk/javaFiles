package topcrowd_challenges;

public class MissingPositiveInteger {

	public static void main(String[] args) {
		int[] arr = { 1, 2, 3, 4, 5 };
		int n = arr.length;
		findMissingNum(arr, n);

	}

	private static void findMissingNum(int[] arr, int n) {
		for (int i = 1; i < n + 1; i++) {
			boolean flag = true;
			for (int j = 0; j < n; j++) {
				if (arr[j] == i) {
					flag = false;
					break;
				}
			}
			if (flag == true) {
				System.out.println(i);
			}
			
		}
		

	}

}
