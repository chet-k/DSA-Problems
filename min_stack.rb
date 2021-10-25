=begin
https://leetcode.com/problems/min-stack/
https://leetcode.com/submissions/detail/576690433/
=end

class MinStack
  def initialize()
    @stack = []
  end

  def push(val)
    if @stack.empty?
      @stack.push([val, val])
    else
      prev_min = @stack[-1][1]
      new_min = val < prev_min ? val : prev_min
      @stack.push([val, new_min])
    end
  end

  def pop()
    @stack.pop[0]
  end

  def top()
    @stack[-1][0]
  end

  def get_min()
    @stack[-1][1]
  end
end