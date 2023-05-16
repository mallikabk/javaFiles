package assignmentOOPs;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Calendar;
import java.util.Scanner;

public class AgeCalculator {
	public double calculateAge(int birthmonth, int birthyear) {
		Calendar cal = Calendar.getInstance();
		double age;
		int currentyear = cal.get(Calendar.YEAR);
		int currentmonth = cal.get(Calendar.MONTH) + 1;

		if (birthmonth < 0 || birthyear < 0) {
			return -1.0;
		}
		if (birthmonth > currentmonth || birthyear > currentyear) {
			return -2.0;
		} else {
			int byear = currentyear - birthyear;
			System.out.println(byear + " :   Years");
			double bmonth = (int) currentmonth - birthmonth;
			System.out.println(bmonth + ":   months");
			age = byear + (bmonth / 12);
		}

		return age;

	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter birth year:");
		int year = sc.nextInt();
		System.out.println("Enter birth month:");
		int month = sc.nextInt();
		AgeCalculator getage = new AgeCalculator();
		System.out.println("Your Age  is :" + getage.calculateAge(month, year));

	}

}
