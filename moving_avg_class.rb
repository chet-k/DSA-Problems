=begin
https://leetcode.com/problems/moving-average-from-data-stream/
https://leetcode.com/submissions/detail/552659920/

Implemented using double-ended queue, optimal LC solution
Submitted as part of mock assessment
=end

class MovingAverage
=begin
    Initialize your data structure here.
    :type size: Integer
=end
    def initialize(size)
        @size = size
        @window = Queue.new
        @avg = nil
        @tot = 0
    end

=begin
    :type val: Integer
    :rtype: Float
=end
    def next(val)
        @window.push(val)
        @tot += val
        @tot -= @window.pop if @window.size > @size
        @avg = @tot * 1.0 / @window.size
    end
end

# Your MovingAverage object will be instantiated and called as such:
# obj = MovingAverage.new(size)
# param_1 = obj.next(val)