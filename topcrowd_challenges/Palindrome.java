package topcrowd_challenges;

import java.util.Scanner;

public class Palindrome {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter a number : ");
		int number = sc.nextInt();
		System.out.println(isPalindrome(number));

	}

	private static int isPalindrome(int number) {
		int rem = 0;
		int temp = number;
		int reverse = 0;
		int result = 0;
		if (number < 0 || number == 0) {
			return -1;
		}
		if (number > 999) {
			return -2;
		} else {
			while (number != 0) {
				rem = number % 10;
				number = number / 10;
				reverse = (reverse * 10) + rem;
			}
			if (reverse == temp) {
				result = 1;
			}
			return result;
		}
	}
}
