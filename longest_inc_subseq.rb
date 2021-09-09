=begin
https://leetcode.com/submissions/detail/552121782/
https://leetcode.com/problems/longest-increasing-subsequence/
=end

# @param {String} s1
# @param {String} s2
# @return {Integer}
def minimum_delete_sum(s1, s2)
    dp = Array.new(s1.length + 1) { Array.new(s2.length + 1) }
    dp[s1.length][s2.length] = 0
    
    (0...s1.length).reverse_each do |i| 
        dp[i][s2.length] = dp[i+1][s2.length] + s1[i].ord
    end
    
    (0...s2.length).reverse_each do |j|
        dp[s1.length][j] = dp[s1.length][j+1] + s2[j].ord
    end
    
    (0...s1.length).reverse_each do |i|
        (0...s2.length).reverse_each do |j|
            if s1[i] == s2[j]
                dp[i][j] = dp[i+1][j+1]
            else
                delete_i = s1[i].ord + dp[i+1][j]
                delete_j = s2[j].ord + dp[i][j+1]
                dp[i][j] = [delete_i, delete_j].min
            end
        end
    end
    dp[0][0]
end