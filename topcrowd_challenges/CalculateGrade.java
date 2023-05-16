package topcrowd_challenges;

import java.util.Scanner;

public class CalculateGrade {
	private static void findAverage(int[] array, int subjects, String name) {
		int average = 0;
		int sum = 0;
		for (int i = 0; i < array.length; i++) {
			sum += array[i];
		}
		average = sum / subjects;
		System.out.println("Average marks is :" + average);
		findGrade(average, name);
	}

	public static void findGrade(int avg, String name) {
		if (avg < 60) {
			System.out.println(name + " You  got : F  Grade....!!");
		} else if (avg < 70) {
			System.out.println(name + " You  got : D  Grade....!!");

		} else if (avg < 80) {
			System.out.println(name + " You  got : C  Grade....!!");
		} else if (avg < 90) {
			System.out.println(name + " You  got : B Grade....!!");
		} else if (avg < 100) {
			System.out.println(name + " You  got : A  Grade....!!");
		}
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("ENter Studetn name : ");
		String name = sc.next();
		System.out.println("Enter how many subjects : ");
		int no_of_subjects = sc.nextInt();
		int subjectsArray[] = new int[no_of_subjects];
		for (int i = 0; i < no_of_subjects; i++) {
			System.out.println("Enter student marks  in subject : " + (i + 1));
			subjectsArray[i] = sc.nextInt();
		}
		findAverage(subjectsArray, no_of_subjects, name);

	}

}
