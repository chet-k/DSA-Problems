require 'set'

'''
LC 131 https://leetcode.com/problems/palindrome-partitioning/

Given a string s, partition s such that every substring of the partition is a 
palindrome. Return all possible palindrome partitioning of s.

A palindrome string is a string that reads the same backward as forward.

 Example 1:

Input: s = "aab"
Output: [["a","a","b"],["aa","b"]]
Example 2:

Input: s = "a"
Output: [["a"]]
 

Constraints:

1 <= s.length <= 16
s contains only lowercase English letters.
'''

# _all_ possible palindromic partitioning, up to 16-character string.

# sub-problem 1: what are the shortest palindromes within the string?
# Trivial: s.split('')

# sub-problem 2: what are the longest palindromic substrings?
# stack: push, until hit a char == stack[-1] or stack[-2]... doesn't maximize though
# str.reverse on progressively smaller substrings? inefficient
# 2pointers, starting @ middle... seems overly complicated

# DP insight:
# *given an existing partitioning, how do you make a new one?*
# 2 conditions:
#   - two adjacent entries are equal
#   - two entries on either side of another are equal

class Solution
    def partition(s)
        @master_set = Set.new
        partition_helper(s.split(''))

        @master_set.to_a
    end

    def partition_helper(s_arr)
        return nil if @master_set.include?(s_arr)
        @master_set.add(s_arr)

        (0...(s_arr.length-1)).each do |i|
            if s_arr[i] == s_arr[i+1]
                new_arr = s_arr[0...i] + [s_arr[i..i+1].join('')] + s_arr[i+2..-1]
                partition_helper(new_arr)
            end
            
            if i > 0 && s_arr[i-1] == s_arr[i+1]
                new_arr = s_arr[0...i-1] + [s_arr[i-1..i+1].join('')] + s_arr[i+2..-1]
                partition_helper(new_arr)
            end
        end
    end
end

s = Solution.new
p s.partition('aaaa')