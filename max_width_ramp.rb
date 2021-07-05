"""
LC 962. Maximum Width Ramp
https://leetcode.com/problems/maximum-width-ramp/

Given an array nums of integers, a ramp is a tuple (i, j) for which i < j 
and nums[i] <= nums[j].  The width of such a ramp is j - i.

Find the maximum width of a ramp in nums.  If one doesn't exist, return 0.

"""

def max_width_ramp(nums)
    # now do a stack.
    # trick: a *decreasing* stack will help the most.
    #   [6, 0, 8, 2, 1, 5]
    #   -> decreasing stack is just [6, 0]
    #   that's fine, anything to the right of 0 cannot possibly be a longer ramp than a ramp starting at 0
    
    max_ramp = 0
    stack = [[nums[0], 0]]
    
    nums[1..-1].each_with_index {|n, i| stack.push([n, i+1]) if n < stack[-1][0]}
    
    (nums.length-1).downto(0).each do |j| 
        until stack.empty? || nums[j] < stack[-1][0]
            ni, i = stack.pop
            max_ramp = [max_ramp, j - i].max
        end
    end
   
    max_ramp
end


# this is TLE on LC
def max_width_ramp_quadratic(nums)
    # try naive first: check every pair. 
    # this is O(N^2) worst case where nums is strictly decreasing
    max_ramp = 0
    (0...nums.length-1).each do |i|
        (i...nums.length).each do |j|
            max_ramp = j - i if nums[j] >= nums[i] && (j - i) > max_ramp
        end
    end
    
    max_ramp
end

"""

Example 1:

Input: nums = [6,0,8,2,1,5]
Output: 4
Explanation: 
The maximum width ramp is achieved at (i, j) = (1, 5): nums[1] = 0 and nums[5] = 5.
Example 2:

Input: nums = [9,8,1,0,1,9,4,0,4,1]
Output: 7
Explanation: 
The maximum width ramp is achieved at (i, j) = (2, 9): nums[2] = 1 and nums[9] = 1.

"""