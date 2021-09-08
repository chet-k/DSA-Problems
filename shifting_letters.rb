'''
https://leetcode.com/problems/shifting-letters/
https://leetcode.com/submissions/detail/551685153/

You are given a string s of lowercase English letters and an integer array shifts of the same length.

Call the shift() of a letter, the next letter in the alphabet, (wrapping around so that 'z' becomes 'a').

For example, shift('a') = 'b', shift('t') = 'u', and shift('z') = 'a'.
Now for each shifts[i] = x, we want to shift the first i + 1 letters of s, x times.

Return the final string after all such shifts to s are applied.

 

Example 1:

Input: s = "abc", shifts = [3,5,9]
Output: "rpl"
Explanation: We start with "abc".
After shifting the first 1 letters of s by 3, we have "dbc".
After shifting the first 2 letters of s by 5, we have "igc".
After shifting the first 3 letters of s by 9, we have "rpl", the answer.
Example 2:

Input: s = "aaa", shifts = [1,2,3]
Output: "gfd"
 
Constraints:

  1 <= s.length <= 10^5
  s consists of lowercase English letters.
  shifts.length == s.length
  0 <= shifts[i] <= 10^9
'''

# @param {String} s
# @param {Integer[]} shifts
# @return {String}
def shifting_letters(s, shifts)
    new_chars = []
    n_shifts = simplify_shifts(shifts)
    s.split('').zip(n_shifts) {|char, n| new_chars << shift(char,n)}
    new_chars.join('')
end

def simplify_shifts(shifts)
    out = [0] * shifts.length
    out[-1] = shifts[-1]
    (0...shifts.length-1).reverse_each do |i|
        out[i] = shifts[i] + out[i + 1]
    end
    out
end

def shift(char, n)
    #only lowercase letters, which are ord 97 thru 122
    new_ord = char.ord + (n % 26)
    new_ord = 97 + (new_ord % 123) if new_ord > 122
    new_ord.chr
end