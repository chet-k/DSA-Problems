"""
https://leetcode.com/problems/roman-to-integer/submissions/
https://leetcode.com/submissions/detail/534868342/

Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9. 
X can be placed before L (50) and C (100) to make 40 and 90. 
C can be placed before D (500) and M (1000) to make 400 and 900.
Given a roman numeral, convert it to an integer.

 

Example 1:

Input: s = 'III'
Output: 3
Example 2:

Input: s = 'IV'
Output: 4
Example 3:

Input: s = 'IX'
Output: 9
Example 4:

Input: s = 'LVIII'
Output: 58
Explanation: L = 50, V= 5, III = 3.
Example 5:

Input: s = 'MCMXCIV'
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 

Constraints:

1 <= s.length <= 15
s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
It is guaranteed that s is a valid roman numeral in the range [1, 3999].
"""

# @param {String} s
# @return {Integer}
def roman_to_int(s)
    # step 1: transform each char into its simple integer value
    #   store these in an array.
    #
    # Step 2: handle special case from within the array.
    #   if values[i] < values[i+1], then increment i TWICE and add
    #       (values[i+1] - values[i]) to total.
    
    value_map = {
        "I" => 1,
        "V" => 5,
        "X" => 10,
        "L" => 50,
        "C" => 100,
        "D" => 500,
        "M" => 1000
    }
    
    s_values = s.chars.map{|char| value_map[char]}
    
    i, total = 0, 0
    while i < s.length
        if i == (s.length - 1) || s_values[i] >= s_values[i+1]
            total += s_values[i]
            i += 1
        else
            total += s_values[i+1] - s_values[i]
            i += 2
        end
    end
    
    total
end