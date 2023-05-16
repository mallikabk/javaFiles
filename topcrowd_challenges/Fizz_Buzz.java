package topcrowd_challenges;

import java.util.Scanner;

public class Fizz_Buzz {
	public void getFizzBizz(int num) {
		String s = "";
		for (int i = 1; i <= num; i++) {
			if (i % 3 == 0 && i % 5 == 0) {
				// s = "FIZZBIZZ";
				System.out.println(i + " Fizzbuzz");
			} else if (i % 5 == 0) {
				// s = "BIZZ";
				System.out.println(i + " Buzz");
			} else if (i % 3 == 0) {
				// s = "FIZZ";
				System.out.println(i + " Fizz");
			} else {
				// s += num;
				System.out.println(i);

			}
		}

	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Input range :");
		int n = sc.nextInt();
		Fizz_Buzz obj = new Fizz_Buzz();
		obj.getFizzBizz(n);

	}

}
