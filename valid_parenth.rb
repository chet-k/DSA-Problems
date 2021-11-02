=begin
https://leetcode.com/problems/valid-parentheses/
https://leetcode.com/submissions/detail/578258042/
=end

def is_valid(s)
  stack = []
  s.each_char do |char|
    if char == "(" || char == "{" || char == "["
      stack.push(char)
    elsif char == ")"
      return false unless stack.pop == "("
    elsif char == "}"
      return false unless stack.pop == "{"
    elsif char == "]"
      return false unless stack.pop == "["
    end
  end
  stack.empty?
end