package topcrowd_challenges;

import java.util.Scanner;

public class EvenOddNumber {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter a Number : ");
		int number = sc.nextInt();
		System.out.println(isEvenOdd(number));
	}

	private static String isEvenOdd(int number) {
		String s = "";
		System.out.print(number + " is  ");
		if (number == 0) {
			s = "Invalid Input";
		} else {
			if (number % 2 == 0) {
				s = "Even number";
			} else {
				s = "Odd Number";
			}
			return s;
		}
		return s;
	}

}
