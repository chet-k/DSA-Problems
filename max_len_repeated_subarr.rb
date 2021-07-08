"""
Maximum Length of Repeated Subarray

Given two integer arrays nums1 and nums2, return the maximum length of a subarray that appears in both arrays.

 

Example 1:

Input: nums1 = [1,2,3,2,1], nums2 = [3,2,1,4,7]
Output: 3
Explanation: The repeated subarray with maximum length is [3,2,1].
Example 2:

Input: nums1 = [0,0,0,0,0], nums2 = [0,0,0,0,0]
Output: 5
 

Constraints:

1 <= nums1.length, nums2.length <= 1000
0 <= nums1[i], nums2[i] <= 100
"""

require 'set'
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}

# had to look up DP solution. coding from memory for exercise
def find_length(nums1,nums2)
    #subproblem: find where *characters* match. 
    #DP insight: memoize the longest common prefix/suffix in a matrix.
    dp = Array.new(nums1.length) {Array.new(nums2.length,0)}
    
    (0...nums1.length).each do |i1|
        (0...nums2.length).each do |i2|
            if nums1[i1] == nums2[i2]
                memo = 1
                memo += dp[i1-1][i2-1] if i1 > 0 && i2 > 0
                dp[i1][i2] = memo
            end
        end
    end
    
    max_sub = 0
    dp.each {|row| max_sub = [max_sub, row.max].max}
    max_sub
end

def print_array(arr)
    arr.each {|row| puts "#{row}"}
end

def find_length_brute_force(nums1,nums2)
    max_sub_length = 0
    slow_i1 = 0 
    while  slow_i1 < nums1.length
        i1 = slow_i1
        slow_i2 = 0
        while slow_i2 < nums2.length
            i2 = slow_i2
            i1 = slow_i1
            sub_length = 0
            while nums1[i1] == nums2[i2] && i1 < nums1.length && i2 < nums2.length
                sub_length += 1
                i1 += 1
                i2 += 1
                max_sub_length = [sub_length, max_sub_length].max
                return max_sub_length if i1 == nums1.length && i2 == nums2.length
            end
            slow_i2 += 1
        end
        slow_i1 += 1
    end

    max_sub_length
end