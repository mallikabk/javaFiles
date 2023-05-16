package topcrowd_challenges;

public class MajorityElement {

	public static void main(String[] args) {
		int[] nums = { 2, 8, 7, 2, 2, 5, 2, 3, 1, 2, 2 };
		int n = (nums.length) / 2;
		System.out.println("Majority element is : " + findMajorityElement(nums, n));

	}

	// finding majority element
	private static int findMajorityElement(int[] nums, int n) {
		int majorityEle = 0;
		for (int i = 0; i < nums.length - 1; i++) {
			int count = 0;
			for (int j = i + 1; j < nums.length; j++) {
				if (nums[i] == nums[j]) {
					count++;
				}
				if (count >= n) {

					majorityEle = nums[i];
				}
			}
		}
		return majorityEle;

	}

}
