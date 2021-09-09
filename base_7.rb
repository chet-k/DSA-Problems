=begin
submitted as part of mock assessment
https://leetcode.com/submissions/detail/551792700/
https://leetcode.com/problems/base-7/

Given an integer num, return a string of its base 7 representation.
 

Example 1:

Input: num = 100
Output: "202"
Example 2:

Input: num = -7
Output: "-10"

=end

# @param {Integer} num
# @return {String}
def convert_to_base7(num)
    # digit by digit using mod?
    # 8: first digit is 8 % 7 = 1
    # next digit: divide num by 7: 1 -> 1 % 7  = 1
    return "0" if num == 0
    digits = []
    neg_sign = num < 0
    num *= - 1 if neg_sign
    while num > 0
        digits << num % 7
        num /= 7
    end
    digits << '-' if neg_sign
    digits.reverse.join('')
end