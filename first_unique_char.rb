=begin
https://leetcode.com/problems/first-unique-character-in-a-string/
https://leetcode.com/submissions/detail/559995900/
=end

# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  counts = Hash.new(0)
  s.each_char {|c| counts[c] += 1}
  s.each_char.with_index {|c, i| return i if counts[c] == 1}
  -1
end