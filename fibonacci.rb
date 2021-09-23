=begin
https://leetcode.com/problems/fibonacci-number/
https://leetcode.com/submissions/detail/553836013/

Part of DP study day 1
=end

# @param {Integer} n
# @return {Integer}

def fib(n)
  dp = Array.new(n+1)  
  dp[0], dp[1] = 0, 1
  (2..n).each {|i| dp[i] = dp[i-1] + dp[i-2]}
  dp[n]
end