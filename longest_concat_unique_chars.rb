=begin
https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters/
https://leetcode.com/submissions/detail/559480922/

Need backtracking!
=end

# @param {String[]} arr
# @return {Integer}
def max_length(arr)
  @arr = arr
  @seen = Set.new
  @max_concat = 0
  backtrack_helper('', 0)
  @max_concat
end

def backtrack_helper(path, i_s)
  return if i_s == @arr.length
  cur_word = @arr[i_s]
  new_path = path + cur_word
  dup_chars_in_cur = (new_path).length != Set.new((new_path).split('')).size
  unless @seen.include?(new_path) || dup_chars_in_cur
    @seen.add(new_path)
    @max_concat = new_path.length > @max_concat ? new_path.length : @max_concat
    backtrack_helper(new_path, i_s + 1)
  end
  backtrack_helper(path, i_s + 1)
end