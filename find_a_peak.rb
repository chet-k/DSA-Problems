# https://leetcode.com/submissions/detail/522084064/?from=explore&item_id=3812

# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
    i = nums.length/2
    if i == 0
        0 
    elsif nums.length == 2
        nums[0] > nums[1] ? 0 : 1
    elsif nums[i] > nums[i+1] && nums[i] > nums[i-1]
        i
    elsif nums[i] < nums[i-1]
        find_peak_element(nums[0...i])
    else
        i + find_peak_element(nums[i+1..-1]) + 1
    end    
end