'''
167. Two Sum II - Input array is sorted
https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/


Given an array of integers numbers that is already sorted in non-decreasing 
order, find two numbers such that they add up to a specific target number.

Return the indices of the two numbers (1-indexed) as an integer array answer 
of size 2, where 1 <= answer[0] < answer[1] <= numbers.length.

The tests are generated such that there is exactly one solution. You may not 
use the same element twice.

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
'''

# the hash map way still works, but we might not be taking advantage of 
# the input array being sorted.
def two_sum_hash(numbers, target)
    n_index = {} 
    (0...numbers.length).each do |i2|
        i1 = n_index[target - numbers[i2]] 

        # We know that n[i2] > n[i1] because input array is sorted.
        return [i1 + 1, i2 + 1] if i1 && i1 != i2
        n_index[numbers[i2]] = i2
    end
end

# if we need constant memory, sorted input allows us to use two pointer approach.
def two_sum(numbers, target)
    n_index = {} 
    (0...numbers.length).each do |i1|
        i2 = n_index[target - numbers[i1]]
        return [i1 + 1, i2 + 1].sort if i2 && i2 != i1 
        n_index[numbers[i1]] = i1
    end
end




'''
Example 1:

Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
Example 2:

Input: numbers = [2,3,4], target = 6
Output: [1,3]
Example 3:

Input: numbers = [-1,0], target = -1
Output: [1,2]
'''
