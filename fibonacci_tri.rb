=begin
https://leetcode.com/submissions/detail/553834344/
https://leetcode.com/problems/n-th-tribonacci-number/


=end

def tribonacci(n)
  dp = Array.new(n + 1)
  dp[0], dp[1], dp[2] = 0, 1, 1
  (3..n).each {|i| dp[i] = dp[i-1]  + dp[i-2] + dp[i-3]}
  dp[n]
end