package topcrowd_challenges;

public class MaxSumOfSubArray {

	public static void main(String[] args) {
		int[] nums = {-2, 1, -3, 4, -1, 2, 1, -5, 4};
		System.out.println("maximum of subarray is : "+findMaxsubArraySum(nums));

	}

	private static int findMaxsubArraySum(int[] nums) {
		int maxsum = 0;
		for (int i = 0; i < nums.length; i++) {
			int sum = nums[i];
			for (int j = i + 1; j < nums.length; j++) {
				sum += nums[j];
				if (sum > maxsum) {
					maxsum = sum;
				}
			}
		}
		return maxsum;
		
	}

}
