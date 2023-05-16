package topcrowd_challenges;

import java.util.Scanner;

public class EvenOddNextMultiple {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter a number : ");
		int num = sc.nextInt();
		System.out.println(oddRounder(num));

	}

//finding next multiple if it is odd number
	private static int oddRounder(int num) {
		int res = 0;
		if (num < 0) {
			// given number is negative
			return -1;
		}
		if (num == 0) {
			// given number is Zero
			return -2;
		}
		if (num % 2 == 0) {
			// given number is even
			res = num;
		} else {
			int rem = num % 10;
			res = num - rem + 10;

		}
		// given number is odd
		return res;

	}

}
