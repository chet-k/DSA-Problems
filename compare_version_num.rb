=begin
https://leetcode.com/submissions/detail/574485425/
https://leetcode.com/problems/compare-version-numbers/

Could have done character by character for O(1) memory, could argue code-golf 
drove decision not to. But avoiding lots of if/else by going through the string
character by character is a lot more complex to code and not hugely better.
=end

# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
  v1 = version1.split('.').map {|s| s.to_i}
  v2 = version2.split('.').map {|s| s.to_i}
  i = 0
  while i < [v1.length, v2.length].min
    return -1 if v1[i] < v2[i]
    return 1 if v2[i] < v1[i]
    i += 1
  end
  if v1.length < v2.length
    v2[i..-1].all? {|v| v == 0} ? 0 : -1
  elsif v2.length < v1.length
    v1[i..-1].all? {|v| v == 0} ? 0 : 1
  else
    0
  end
end