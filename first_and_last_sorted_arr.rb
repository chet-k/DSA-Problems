# Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

# If target is not found in the array, return [-1, -1].

# You must write an algorithm with O(log n) runtime complexity.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
require 'byebug'
def search_range(nums, target)
    i_target_mid = binary_search(nums,target)

    
end

def binary_search(nums, target)
    return -1 if nums.length == 0
    
    i = nums.length / 2
    n = nums[i]
    
    if n > target
        i = binary_search(nums[0...i],target)
    elsif n < target
        i_found = binary_search(nums[i+1..-1],target)
        i = i_found == -1 ? -1 : i + i_found + 1
    end
    
    i
end