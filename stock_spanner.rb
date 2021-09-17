=begin
https://leetcode.com/problems/online-stock-span/
https://leetcode.com/submissions/detail/556231087/
=end


class StockSpanner
  def initialize()
    @price_history = []
    @span_history = []
  end

=begin
  :type price: Integer
  :rtype: Integer
=end
  def next(price)
    span = 1
    unless @price_history.empty? || @price_history[-1] > price
      span += backtrack(@span_history[-1], price)
    end
    @span_history << span
    @price_history << price
    @span_history[-1]
  end
  
  def backtrack(n, price)
    if price < @price_history[-n]
      n - 1
    elsif n == @price_history.length 
      n
    elsif price >= @price_history[-n]
      new_n = [@price_history.length, n + @span_history[-n]].min
      backtrack(new_n, price)
    end
  end
end

# Your StockSpanner object will be instantiated and called as such:
# obj = StockSpanner.new()
# param_1 = obj.next(price)

# checking back through the full prices every day is O(N2). Basic to implement though.

# We kind of have DP built in. If price goes up, we know the day's span is at LEAST 1 + (yesterday_span). 
# Then we can go back yesterday_span days, and if that day is still lower, go back that many days... 
# changes worst case a lot - continuously increasing would be O(N) instead of O(N2)!
