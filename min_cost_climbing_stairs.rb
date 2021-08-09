'''
https://leetcode.com/problems/min-cost-climbing-stairs/
https://leetcode.com/submissions/detail/535798747/

You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index 0, or the step with index 1.

Return the minimum cost to reach the top of the floor.

 

Example 1:

Input: cost = [10,15,20]
Output: 15
Explanation: Cheapest is: start on cost[1], pay that cost, and go to the top.
Example 2:

Input: cost = [1,100,1,1,1,100,1,1,100,1]
Output: 6
Explanation: Cheapest is: start on cost[0], and only step on 1s, skipping cost[3].

'''

# @param {Integer[]} cost
# @return {Integer}

# signs we need DP:
#   MINIMIZE / MAXIMIZE
#   Choices depend on EARLIER CHOICES
#
# The min cost to get to index i
# is the minimum of each of the two preceeding min path costs 
#   plus their own step costs

def min_cost_climbing_stairs(cost)
    memo = [0] * (cost.length + 1)
    
    (2...memo.length).each do  |i|
        memo[i] = [
            memo[i-1] + cost[i-1],
            memo[i-2] + cost[i-2]
        ].min
    end
    
    memo[-1]
end