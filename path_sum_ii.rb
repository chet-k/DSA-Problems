'''
https://leetcode.com/problems/path-sum-ii/
https://leetcode.com/submissions/detail/533483857/
'''

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} target_sum
# @return {Integer[][]}
def path_sum(root, target_sum)
    @cur_path = []
    @cur_sum = 0
    @target_sum = target_sum
    @res = []
    dfs(root)
    
    @res
end

def dfs(node)
    return unless node
    
    @cur_sum += node.val
    @cur_path << node.val
    
    if @cur_sum == @target_sum && !(node.left || node.right)
        @res << @cur_path.dup 
    end
    
    dfs(node.left)
    dfs(node.right)
    
    @cur_sum -= node.val
    @cur_path.pop()
end