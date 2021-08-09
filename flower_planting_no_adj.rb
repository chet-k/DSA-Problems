'''
Submitted as part of timed assessment
https://leetcode.com/problems/flower-planting-with-no-adjacent/
https://leetcode.com/submissions/detail/535849741/ (cleaned up, per below)

original timed submission https://leetcode.com/submissions/detail/535798747/

You have n gardens, labeled from 1 to n, and an array paths where 
paths[i] = [xi, yi] describes a bidirectional path between garden xi to 
garden yi. In each garden, you want to plant one of 4 types of flowers.

All gardens have at most 3 paths coming into or leaving it.

Your task is to choose a flower type for each garden such that, for any two 
gardens connected by a path, they have different types of flowers.

Return any such a choice as an array answer, where answer[i] is the type of 
flower planted in the (i+1)th garden. The flower types are denoted 1, 2, 3, or 4. 
It is guaranteed an answer exists.
 

Example 1:

Input: n = 3, paths = [[1,2],[2,3],[3,1]]
Output: [1,2,3]
Explanation:
    Gardens 1 and 2 have different types.
    Gardens 2 and 3 have different types.
    Gardens 3 and 1 have different types.
    Hence, [1,2,3] is a valid answer. Other valid answers include [1,2,4], [1,4,2], and [3,2,1].


Example 2:
Input: n = 4, paths = [[1,2],[3,4]]
Output: [1,2,1,2]


Example 3:
Input: n = 4, paths = [[1,2],[2,3],[3,4],[4,1],[1,3],[2,4]]
Output: [1,2,3,4]
 

Constraints:
    1 <= n <= 10^ 4
    0 <= paths.length <= 2 * 10^4
    paths[i].length == 2
    1 <= xi, yi <= n
    xi != yi
    Every garden has at most 3 paths coming into or leaving it.
'''

# note right away this is a graph problem. 
# but we are only given list of edges, when an adjacency list would be useful 
# since the problem is constrained based on properties of each garden's neighbor.

# given problem constraints, prefer adjacency list over adj matrix. 
# a matrix would be very sparse since each garden has at most 3 adjacencies, but
# there are potentially 10^4 gardens.

# Then visit each garden and plant at each of its neighbors (sort of 1-depth BFS)

# The problem of marking visited gardens is taken care of by the answer array.

# @param {Integer} n
# @param {Integer[][]} paths
# @return {Integer[]}

def garden_no_adj(n, paths)
    adj_list = Array.new(n) {Array.new}
    answer = Array.new(n, 0)
    
    paths.each do |path|
        i1, i2 = path[0] - 1, path[1] - 1
        adj_list[i1] << i2
        adj_list[i2] << i1
    end
    
    for i in 0...answer.length do
        adj_flowers = Set.new(adj_list[i].map {|adj_garden| answer[adj_garden]})
        f = 1
        f += 1 while adj_flowers.include?(f) 
        answer[i] = f
    end
    
    answer
end