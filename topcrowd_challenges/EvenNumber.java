package topcrowd_challenges;

import java.util.Scanner;

public class EvenNumber {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("ENter a number :");
		int num = sc.nextInt();
		System.out.println(isEven(num));
	}

	private static int isEven(int num) {
		if (num < 0 || num == 0) {
			return -1;
		}
		if (num % 2 == 0) {
			return 1;
		}

		return 0;

	}

}
