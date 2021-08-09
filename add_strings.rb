'''
https://leetcode.com/problems/add-strings/
https://leetcode.com/submissions/detail/535837020/

Given two non-negative integers, num1 and num2 represented as string, 
return the sum of num1 and num2 as a string.

You must solve the problem without using any built-in library for handling 
large integers (such as BigInteger). You must also not convert the inputs to 
integers directly.

 

Example 1:

Input: num1 = "11", num2 = "123"
Output: "134"
Example 2:

Input: num1 = "456", num2 = "77"
Output: "533"
Example 3:

Input: num1 = "0", num2 = "0"
Output: "0"
 

Constraints:

1 <= num1.length, num2.length <= 104
num1 and num2 consist of only digits.
num1 and num2 dont have any leading zeros except for the zero itself.
'''

# @param {String} num1
# @param {String} num2
# @return {String}
def add_strings(num1, num2)
    res = ''
    n1, n2 = num1.split(''), num2.split('')
    carry = 0
    while n1.length > 0 && n2.length > 0
        digit1, digit2 = n1.pop.ord - 48, n2.pop.ord - 48
        
        s = digit1 + digit2 + carry
        carry = s / 10
        res = (s % 10).to_s + res
    end
    
    remaining_digits = n1.length > 0 ? n1 : n2
    
    while remaining_digits.length > 0 
        digit = remaining_digits.pop.ord - 48
        s = digit + carry
        carry = s / 10
        res = (s % 10).to_s + res
    end
    
    res = carry.to_s + res if carry > 0
        
    res
end