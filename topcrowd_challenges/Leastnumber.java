package topcrowd_challenges;

import java.util.Scanner;

public class Leastnumber {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter first number :");
		int num1 = sc.nextInt();
		System.out.println("Enter second number :");
		int num2 = sc.nextInt();
		System.out.println( findLeastNum(num1, num2));
	}

	private static int findLeastNum(int num1, int num2) {
		if (num1 < 0 || num2 < 0) {
			return -1;
		}
		if (num1 == 0 || num2 == 0) {
			return -2;
		} else {
			if (num1 < num2) {
				return num1;
			} else {

				return num2;
			}

		}
	}

}
