'''
https://leetcode.com/problems/count-univalue-subtrees/
https://leetcode.com/submissions/detail/533477394/
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
# @return {Integer}
def count_unival_subtrees(root)
    @count = 0
    dfs_unival(root)
    @count
end

def dfs_unival(node)
    
    if !node
        return true
    elsif !node.left && !node.right
        @count += 1
        return true
    end
    
    unival_left = dfs_unival(node.left)
    unival_right = dfs_unival(node.right)
    
    if unival_left && unival_right && 
            (!node.left || node.val == node.left.val) && 
            (!node.right || node.val == node.right.val)
        @count += 1
        return true
    end
    
    false
end