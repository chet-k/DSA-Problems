'''
409. Longest Palindrome
https://leetcode.com/problems/longest-palindrome/
'''

# @param {String} s
# @return {Integer}
def longest_palindrome(s)
    #length of the longest possible palindrome BUILT from letters in S
    
    # brute force: try all permutations and check each for palindrome. 
    # palindrome check O(N) where N is length of str
    # all permutations is worse than O(N^2), maybe factorial? vvv bad
    
    # We only get one odd-count. 
    # We will always use all even-counts.
    # The odd-count needs to be the highest-freq odd-count.
    
    # Find the char with highest odd freq.
    # Reduce count of all other odd-counts by 1
    # counts.values.sum
    counts = Hash.new(0)
    s.each_char {|c| counts[c] += 1}
    
    odd_max_char = ''
    counts.each do |k, v|
        odd_max_char = k if v.odd? && v > counts[odd_max_char]
    end
    
    counts.each do |k, v|
        counts[k] -= 1 if v.odd? && k != odd_max_char
    end

    counts.values.sum
end

'''
Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

 

Example 1:

Input: s = "abccccdd"
Output: 7
Explanation:
One longest palindrome that can be built is "dccaccd", whose length is 7.
Example 2:

Input: s = "a"
Output: 1
Example 3:

Input: s = "bb"
Output: 2

Constraints:
    1 <= s.length <= 2000
    s consists of lowercase and/or uppercase English letters only.
'''