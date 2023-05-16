package topcrowd_challenges;

import java.util.Arrays;

public class N_Ropes_MinimalCost {
	public static void findMinimalCost(int[] arr) {
		Arrays.sort(arr);
		System.out.println(Arrays.toString(arr));
		int cost = 0;
		int total_cost = 0;
		for (int i = 0; i < arr.length; i++) {
			cost = cost + arr[i];
			if (i != 0) {
				total_cost += cost;
			}
		}
		System.out.println(" The total cost for connecting ropes is: " + total_cost);

	}

	public static void main(String[] args) {
		int[] array = { 5, 4, 10, 8 };
		findMinimalCost(array);

	}

}
