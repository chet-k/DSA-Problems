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
# @return {Integer[]}
def inorder_traversal(root)
    out = []
    return out if not root

    out += inorder_traversal(root.left) if root.left
    out += [root.val]
    out += inorder_traversal(root.right) if root.right
    
    out
end