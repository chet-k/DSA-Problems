'''
467. Unique Substrings in Wraparound String
https://leetcode.com/problems/unique-substrings-in-wraparound-string/

s is defined as "...xyzabc...", 
an abc-order infinite wraparound string of lowercase letters.

How many unique substrings of p can be found in s?   
'''

# first attempt works well with lots of repeat characters, but for
# worst case where p is the alphabet repeated hundreds of times, it is
# TLE on leetcode.
# @param {String} p
# @return {Integer}
class Solution
    def find_substring_in_wrapround_string(p)
        # string s could also be defined as ORD 97..122 repeating 
        # so maybe we first want to go thru p, picking out substrings in abc-order (ORD order)
        # and adding them to a set
        @substrings_set = Set.new
        substr = ""
        substrings_arr = []
        p.each_char do |char|
            if substr.length == 0 ||
                    char.ord == (substr[-1].ord + 1) ||
                    char.ord == 97 && substr[-1].ord == 122
                substr += char 
            else
                substr = char
            end
            substrings_arr << substr 
        end
        
        substrings_arr.each {|st| add_substrings_to_set(st)}
        @substrings_set.count
    end

    def add_substrings_to_set(st)
        return if @substrings_set.include?(st) || st.length == 0
        @substrings_set.add(st)
        
        add_substrings_to_set(st[0...-1])
        add_substrings_to_set(st[1..-1])
    end
end


'''
Example 1:

Input: p = "a"
Output: 1
Explanation: Only the substring "a" of p is in s.
Example 2:

Input: p = "cac"
Output: 2
Explanation: There are two substrings ("a", "c") of p in s.
Example 3:

Input: p = "zab"
Output: 6
Explanation: There are six substrings ("z", "a", "b", "za", "ab", and "zab") of p in s.
 

Constraints:

1 <= p.length <= 10^5
p consists of lowercase English letters.
'''