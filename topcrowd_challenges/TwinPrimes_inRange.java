package topcrowd_challenges;

import java.util.Scanner;

public class TwinPrimes_inRange {
	public static void isPrimeNumber(int start, int end) {
		int i;
		int range = 0; int val=0;
		for (i = start; i < end; i++) {
			
			int count = 0;
			for (int j = 1; j < i; j++) {
				if (i % j == 0) {
					count++;
				}
			}
			if (count == 1) {
				System.out.print(""+i+" ");
				val++;
			
			}
		
			if(val ==2) {
				System.out.print("");
				System.out.println();
				val =0;
		    }
			
			
//			if(val%2==0) {
//				System.out.println(",");
//			}
		}

	}

	public static void findTwinPrimes(int num1, int num2) {

	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter first number : ");
		int startNum = sc.nextInt();
		System.out.println("Enter last number : ");
		int lastNum = sc.nextInt();
		System.out.println("twin prime numbers between range " + startNum + " and " + lastNum + " are : ");
		isPrimeNumber(startNum, lastNum);

	}

}
