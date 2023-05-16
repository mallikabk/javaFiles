package topcrowd_challenges;

import java.util.Arrays;

public class BinaryArray {
	public static void findBinaryArray(int[] a) {
		a[0] = a[1] -= a[1] ;
		System.out.println("Resultant Array :"+Arrays.toString(a));
	}
	public static void main(String[] args) {
		int[] arr= {0,9};
		findBinaryArray(arr);

	}
}
