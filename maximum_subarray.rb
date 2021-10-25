=begin
https://leetcode.com/problems/maximum-subarray/
https://leetcode.com/submissions/detail/576679053/
=end

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  max = nums[0]
  cur_sum = 0
  nums.each do |n|
    if cur_sum < 0
      cur_sum = n
    else
      cur_sum += n
    end
    max = cur_sum if cur_sum > max
  end
  max
end