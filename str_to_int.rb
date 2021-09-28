'''
https://leetcode.com/problems/string-to-integer-atoi/
https://leetcode.com/submissions/detail/562111093/
'''

# @param {String} s
# @return {Integer}
def my_atoi(s)
  max_int = 2**31 - 1
  min_int = -1 * (2**31)
  int_out = 0
  sign = 1
  i = 0
  
  while s[i] == " "
    i += 1
  end
  
  sign = -1 if s[i] == "-"
  
  i += 1 if s[i] == "+" || s[i] == "-"
  
  while i < s.length && s[i].ord > 47 && s[i].ord < 58
    return max_int if max_int / 10 < int_out * sign
    return min_int if min_int / 10 > int_out * sign
    
    digit = s[i].ord - 48
    int_out *= 10
    if sign == 1 && max_int - int_out <= digit
      return max_int
    elsif sign == -1 && min_int + int_out >= -digit
      return min_int
    else
      int_out += digit
      i += 1
    end
  end
  
  int_out * sign
end