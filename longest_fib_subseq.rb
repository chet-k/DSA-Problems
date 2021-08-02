"""
873. Length of Longest Fibonacci Subsequence
https://leetcode.com/problems/length-of-longest-fibonacci-subsequence/

A sequence x1, x2, ..., xn is Fibonacci-like if:

    n >= 3
    AND
    xi + xi+1 == xi+2 for all i + 2 <= n

Given a strictly increasing array arr of positive integers forming a sequence, 
return the length of the longest Fibonacci-like subsequence of arr. If one does 
not exist, return 0.

A subsequence is derived from another sequence arr by deleting any number of 
elements (including none) from arr, without changing the order of the remaining 
elements. For example, [3, 5, 8] is a subsequence of [3, 4, 5, 6, 7, 8].
"""

# @param {Integer[]} arr
# @return {Integer}
def len_longest_fib_subseq(arr)
    nums = Set.new(arr)
    max_len = 0
    (0..arr.length-2).each do |i|
        (i+1..arr.length-1).each do |j|
            seq_len = fib_helper(arr[i], arr[j], nums)
            max_len = [max_len, seq_len].max if seq_len > 2
        end
    end
    max_len
end

def fib_helper(n1, n2, nums)
    if nums.include?(n1+n2)
        1 + fib_helper(n2, n1+n2, nums)
    else
        2
    end
end


# len_longest_fib_subseq([1,2,3]) # => 3
# len_longest_fib_subseq([1,2,3,4,5,6,7,8]) # => 5
# len_longest_fib_subseq([1,3,7,11,12,14,18]) # # => 3
