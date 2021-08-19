=begin
https://leetcode.com/problems/range-sum-query-immutable/
https://leetcode.com/submissions/detail/539454942/?from=explore&item_id=3892

Given an integer array nums, handle multiple queries of the following type:

Calculate the sum of the elements of nums between indices left and right 
inclusive where left <= right.
Implement the NumArray class:

NumArray(int[] nums) Initializes the object with the integer array nums.
int sumRange(int left, int right) Returns the sum of the elements of nums 
between indices left and right inclusive 
(i.e. nums[left] + nums[left + 1] + ... + nums[right]).
=end


class NumArray

=begin
  :type nums: Integer[]
=end
  def initialize(nums)
    @nums = nums
    @left_sum = Array.new(0, nums.length)
    @left_sum[0] = nums[0]
    (1...nums.length).each {|i| @left_sum[i] = @left_sum[i-1] + nums[i]}
  end

=begin
  :type left: Integer
  :type right: Integer
  :rtype: Integer
=end
  def sum_range(left, right)
    sum = @left_sum[right]
    sum -= @left_sum[left-1] if left > 0
    sum
  end
end

# Your NumArray object will be instantiated and called as such:
# obj = NumArray.new(nums)
# param_1 = obj.sum_range(left, right)