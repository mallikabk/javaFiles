package topcrowd_challenges;

import java.util.Scanner;

public class NextMultipleOf100 {
	
		static Scanner sc=new Scanner(System.in);
		
		public int getNextMultipleOf100(int num)
		{
			int rem=num%100;
			int res=num-rem+100;
			if(num<=0)
			{
			return -1;	//the given number is 0 or negative value it returns -1
			}
			
				return res;
			
		}

		public static void main(String[] args) {
		System.out.println("Enter a number:");
		int a=sc.nextInt();
		NextMultipleOf100 e1=new NextMultipleOf100();
		System.out.println("Next multiple of the given number: "+e1.getNextMultipleOf100(a));

		}

	}

