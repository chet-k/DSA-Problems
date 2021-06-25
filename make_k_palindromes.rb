# @param {String} s
# @param {Integer} k
# @return {Boolean}

# key is character counts.
# characters with even-numbered frequency can be added to any palindrome.
# characters with odd-numbered frequency need to be in the center of a palindrome.
# if you have odd-numbered characters cn_odd > k return false.
# else, 
#   subtract cn from total character count
#   we need to be able to add at least a pair of characters to remaining k palindromes, so remaining characters needs to be >= 2*k

require 'byebug'
def can_construct(s, k)
    return false if k > s.length
    return true if k == s.length
    
    counts = Hash.new(0)
    s.each_char {|c| counts[c] += 1}
    
    n_odd = 0
    counts.values.each {|ct| n_odd += 1 if ct.odd?}
    
    debugger
    return false if k < n_odd || (s.length - n_odd) < 2*(k - n_odd)
    true
end

# puts can_construct("ibzkwaxxaggkiwjbeysz", 15)