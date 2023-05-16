package topcrowd_challenges;

import java.util.Arrays;
import java.util.Iterator;
import java.util.Stack;

public class ReverseString {

	public static void main(String[] args) {
		String str = "Technical Interview Preparation";
		
		reverse(str);

	}

	private static void reverse(String str) {
		String[] arr = str.split("\s");
		String[] res_arr=new String[arr.length];
		Stack<String> stk = new Stack<String>();
		
		
		System.out.print("OUTPUT : ");
		for (int i = 0; i < arr.length; i++) {
			stk.push(arr[i]);
		}
		int k = 0;
		while (!stk.isEmpty()) {
			res_arr[k] = stk.pop();
			k++;
		}
		
		Iterator<String> itr =stk.iterator();
		System.out.println("\n");
		while(itr.hasNext()) {
			System.out.println(itr.next());
		}
		
		System.out.print(Arrays.toString(res_arr));
	
	}
}