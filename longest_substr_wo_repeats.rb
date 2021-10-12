=begin
https://leetcode.com/submissions/detail/569702797
https://leetcode.com/problems/longest-substring-without-repeating-characters/
=end

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  return 0 unless s.length > 0
  
  i1, i2 = 0, 1
  max_substr = 1
  last_index_of = Hash.new
  last_index_of[s[i1]] = i1
  
  while i2 < s.length
    if last_index_of[s[i2]] == nil
      last_index_of[s[i2]] = i2
      max_substr = [max_substr, i2 - i1 + 1].max
      i2 += 1
    else
      seen_at = last_index_of[s[i2]]
      until i1 > seen_at
        last_index_of.delete(s[i1])
        i1 += 1
      end
      last_index_of[s[i1]] = i1 if i1 == i2
      i2 = i1 + 1 if i1 >= i2
    end
  end
  
  max_substr
end