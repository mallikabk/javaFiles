package topcrowd_challenges;

import java.util.Scanner;

public class Fibonacci_NthTerm {

		public int getNthTermOfFibonacciSeries(int num) {
			int arr[] = new int[num];
			int c = 0;
			int n1 = 0;
			int n2 = 1;
			int n3 = 0;
			if (num <= 0) {
				return -1;
			}
			if (num > 1) {
				arr[0] = 0;
				arr[1] = 1;
				for (int i = 2; i < arr.length; i++) {
					n3 = n1 + n2;
					if (n3 < num) {
						arr[i] = n3;
						System.out.print(arr[i]+" ");

						n1 = n2;
						n2 = n3;
					}
				}
				System.out.println();

			}

			return n2;
		}

		public static void main(String[] args) {
			Scanner sc = new Scanner(System.in);

			System.out.println("Enter a number: ");
			int number = sc.nextInt();
			Fibonacci_NthTerm obj = new Fibonacci_NthTerm();
			
			System.out.println("Nth term of Fibonacci Sequence is :" + obj.getNthTermOfFibonacciSeries(number));

		}

}
