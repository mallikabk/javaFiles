package topcrowd_challenges;

import java.util.Scanner;

public class SearchSortedArray {

	public static void findIndex(int[] arr, int target) {
		int count = 0;
		
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] == target) {

				count++;
				System.out.println(target + " element found at " + (i + 1) + " th position");
			}
		}
	if(count==0) {
		System.out.println("-1");
	}

	}

	public static void main(String[] args) {
		int[] nums = { 2, 3, 5, 7, 7 };
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter target number:");
		int target = sc.nextInt();
		findIndex(nums, target);

	}

}
