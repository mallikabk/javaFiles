package topcrowd_challenges;

import java.util.Arrays;
import java.util.Scanner;

public class K_thSmallestElement {

	private static void sortArray(int[] arr) {
		int temp = 0;
		for (int i = 0; i < arr.length; i++) {
			for (int j = i + 1; j < arr.length; j++) {
				if (arr[i] > arr[j]) {
					temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
				}
			}
		}

	}

	public static void main(String[] args) {
		int[] arr = { 7, 4, 6, 3, 9, 1 };
		Scanner sc=new Scanner(System.in);
		System.out.println("Enter K value : ");
		int k=sc.nextInt();
		sortArray(arr);
		System.out.println("Sorted Array is : "+Arrays.toString(arr));
		System.out.println("K-th smallest element is : "+arr[k-1]);
	}

}
