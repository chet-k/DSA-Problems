"""
Given an array nums with n objects colored red, white, or blue, 
sort them in-place so that objects of the same color are adjacent, 
with the colors in the order red, white, and blue.

We will use the integers 0, 1, and 2 to represent the color red, white, 
and blue, respectively.

You must solve this problem without using the library's sort function.
"""

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
    #2-pass -> constant space, O(N) time
    # first pass: count all the colors w/hash (or just 3 variables) 
    # second pass: modify so that indices 0...red are 0, red...red+white are 1, red+white..-1 are 2
    
    #less space is bubble sort, but time is worst case O(N^2)
    
    #follow up one-pass.... let's do the 2-pass first
    
    counts = Hash.new(0)
    nums.each {|n| counts[n] += 1}
    
    nums.each.with_index do |n, i|
        if i < counts[0]
            nums[i] = 0
        elsif i < counts[1] + counts[0]
            nums[i] = 1
        else
            nums[i] = 2
        end
    end
end