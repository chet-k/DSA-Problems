'''
This solution worked ok, but time limit exceeded. 
Spent much too long on this before looking at discussion.

Key insight missed: 
https://leetcode.com/problems/count-number-of-nice-subarrays/discuss/508217
'''

require 'byebug'
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def number_of_subarrays(nums, k)
    #CONTINUOUS subarrays means we should be able to do this with 2 pointers.
    
    nice = 0
    i, j, odds = 0, 0, 0
    
    until odds == k || j == nums.length
        odds += 1 if nums[j].odd?
        j += 1
    end
    return 0 if odds < k
    j -= 1 # backtrack because of the while loop setup

    # now j is the index of the kth odd number, nums[0..j] is a nice subarray.
    # start counting nice ones
    
    until j == nums.length - 1 || nums[j+1].odd?
        nice += 1
        j += 1
    end
    nice += 1
    # now increment left pointer and decrement j 
    
    i += 1
    if nums[i-1].even?
        until j == i || nums[j].odd? 
            nice += 1
            j -= 1
        end
        nice += 1
        nice += number_of_subarrays(nums[i+1..-1],k)
    else
        nice += number_of_subarrays(nums[i..-1],k)
    end
    
    nice
end

nums_arr = [
    [2,2,2,1,2,2,1,2,2,2],
    [1,1,2,1,1],
    [2,4,6],
    [1,1,1]
]
k_arr = [2, 3, 1, 2]
expected = [16, 2, 0, 2]
(0...nums_arr.length).each do |i|
    ans = number_of_subarrays(nums_arr[i], k_arr[i])
    puts "-----------------------------------"
    p nums_arr[i]
    p k_arr[i]
    puts "ans: #{ans}  expected: #{expected[i]}"
end
