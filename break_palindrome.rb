=begin
https://leetcode.com/problems/break-a-palindrome/
https://leetcode.com/submissions/detail/559858268/

Not thinking clearly. Got caught up in whether there's some trick or edge case
that we need to code for.
=end

# @param {String} palindrome
# @return {String}
def break_palindrome(palindrome)
  n = palindrome.length
  return '' if n <= 1
  (0...n/2).each do |i|
    return palindrome[0...i] + 'a' + palindrome[i+1...n] unless palindrome[i] == 'a'
  end
  palindrome[0...-1] + 'b'
end



# @param {String} palindrome
# @return {String}
def break_palindrome_inefficient(palindrome)
  n = palindrome.length
  return '' if n <= 1
  
  first_half, mid_char, last_half = palindrome[0...n/2], '', palindrome[(n/2)...n]
  if n.odd?
    mid_char = palindrome[n/2]
    last_half = last_half[1..-1]
  end
  
  (0...first_half.length).each do |i|
    unless first_half[i] == 'a'
      first_half[i] = 'a'
      return first_half + mid_char + last_half
    end
  end
  
  (0...last_half.length).reverse_each do |i|
    unless last_half[i] = 'a'
      last_half[i] = 'a'
      return first_half + mid_char + last_half
    end
  end
  
  last_char = (palindrome[-1].ord + 1).chr
  palindrome[0...-1] + last_char
end