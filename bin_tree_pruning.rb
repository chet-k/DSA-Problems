# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

# @param {TreeNode} root
# @return {TreeNode}
def prune_tree(root)
    
    if root == nil || (root.right == nil && root.left == nil && root.val == 0) 
        return nil
    else
        root.left = prune_tree(root.left)
        root.right = prune_tree(root.right)
    end
    
    if root.right == nil && root.left == nil && root.val == 0
        nil
    else
        root
    end
end