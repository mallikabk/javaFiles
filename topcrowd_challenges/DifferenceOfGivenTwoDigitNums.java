package topcrowd_challenges;

import java.util.Scanner;

public class DifferenceOfGivenTwoDigitNums {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter  number :");
		int num1 = sc.nextInt();

		System.out.println("The difference is :  " + getDiffOfDigits(num1));
	}

	private static int getDiffOfDigits(int num1) {
		int difference = 0;
		int firstDigit = num1 / 10;
		int lastDigit = num1 % 10;
		difference = firstDigit - lastDigit;
		if (num1 < 0) {
			return -3;
		}
		if (num1 > 99) {
			return -2;
		}

		return difference;
	}

}
