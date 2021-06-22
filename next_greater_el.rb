require 'byebug'
"""
NEXT GREATER ELEMENT I
The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.

You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2.

For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.

Return an array ans of length nums1.length such that ans[i] is the next greater element as described above.

 

Example 1:

Input: nums1 = [4,1,2], nums2 = [1,3,4,2]
Output: [-1,3,-1]
Explanation: The next greater element for each value of nums1 is as follows:
- 4 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
- 1 is underlined in nums2 = [1,3,4,2]. The next greater element is 3.
- 2 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
Example 2:

Input: nums1 = [2,4], nums2 = [1,2,3,4]
Output: [3,-1]
Explanation: The next greater element for each value of nums1 is as follows:
- 2 is underlined in nums2 = [1,2,3,4]. The next greater element is 3.
- 4 is underlined in nums2 = [1,2,3,4]. There is no next greater element, so the answer is -1.
 

Constraints:

1 <= nums1.length <= nums2.length <= 1000
0 <= nums1[i], nums2[i] <= 104
All integers in nums1 and nums2 are unique.
All the integers of nums1 also appear in nums2.
"""
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def next_greater_element_i(nums1, nums2)
    ans = [-1] * nums1.length
    
    # brute force: for each nums1, 
    #   1. scan nums2 to find element
    #   2. continue scanning nums2 until greater element 
    #       found (add to ans), or end of nums2 (add -1 to ans)
    
    # stack:
    #   1. 1 pass thru nums1, make a hash s.t. h[n] = i1 where n is element and i1 is index in nums1. 
    #   2. 1 pass thru nums2, push element to stack if empty. if next element is smaller push to stack. on greater element, pop until empty, putting the found element into ans at indices for each el in the stack.
    
    h = {}
    nums1.each_with_index {|n, i1| h[n] = i1}
    
    stack = []
    nums2.each do |n|
        if !stack.empty? && n > stack[-1]
            until stack.empty? || n < stack[-1]
                ni = stack.pop
                ans[h[ni]] = n
            end
        end
        stack << n if h.keys.include?(n)
    end
    ans
end

"""
NEXT GREATER ELEMENT II:
Given a circular integer array nums (i.e., the next element of nums[nums.length - 1] is nums[0]), return the next greater number for every element in nums.

The next greater number of a number x is the first greater number to its traversing-order next in the array, which means you could search circularly to find its next greater number. If it doesn't exist, return -1 for this number.

Example 1:

Input: nums = [1,2,1]
Output: [2,-1,2]
Explanation: The first 1's next greater number is 2; 
The number 2 can't find next greater number. 
The second 1's next greater number needs to search circularly, which is also 2.
Example 2:

Input: nums = [1,2,3,4,3]
Output: [2,3,4,-1,4]
 
Constraints:

1 <= nums.length <= 10^4
-10^9 <= nums[i] <= 10^9
"""
# @param {Integer[]} nums
# @return {Integer[]}
def next_greater_element_ii(nums)
    ans = [-1] * nums.length
    
    stack = []
    i = 0
    
    (nums.length*2).times do 
        if !stack.empty? && nums[i] > nums[stack[-1]]
            until stack.empty? || nums[i] <= nums[stack[-1]]
                ans[stack.pop] = nums[i]
            end
        end
        stack << i    
        i += 1
        i = 0 if i >= nums.length
    end
    
    ans
end

"""
NEXT GREATER ELEMENT III:
Given a positive integer n, find the smallest integer which has exactly the same digits existing in the integer n and is greater in value than n. If no such positive integer exists, return -1.

Note that the returned integer should fit in 32-bit integer, if there is a valid answer but it does not fit in 32-bit integer, return -1.

 

Example 1:

Input: n = 12
Output: 21
Example 2:

Input: n = 21
Output: -1
 

Constraints:

1 <= n <= 231 - 1
"""

# @param {Integer} n
# @return {Integer}
def next_greater_element(n)
    nums = n.to_s.split('')
    i = nums.length - 1
    
    # decrement i until at a local peak. 
    # e.g., while the left-most digits are descending (or equal), we can't
    # perform any swaps among them that would result in a larger integer.
    i -=1 until i == 0 || nums[i-1] < nums[i]
    return -1 if i == 0
    
    # start j at i, and increment until nums[j+1] < nums[i-1]
    # e.g., we want to swap i-1 with the smallest greater digit to the left.
    j = i
    j += 1 until j == nums.length - 1 || nums[j+1] <= nums[i-1]
    nums[i-1], nums[j] = nums[j], nums[i-1]
    
    # finally, reverse the digits from i to the end so that they are 
    # now in ascending order
    nums[i..-1] = nums[i..-1].reverse
    
    ans = nums.join('').to_i
    
    ans > 2**31 - 1 ? -1 : ans
end