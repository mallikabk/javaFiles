package topcrowd_challenges;

import java.util.Scanner;

public class PositiveNegativeNumber {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter a number :");
		int number = sc.nextInt();
		System.out.println(findSign(number));

	}

	private static int findSign(int number) {
		if (number == 0) {
			return 0;
		}
		if (number > 0) {
			return 1;
		}

		return -1;

	}

}
