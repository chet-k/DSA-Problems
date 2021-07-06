'''
101. Symmetric Tree
https://leetcode.com/problems/symmetric-tree/
Given the root of a binary tree, check whether it is a mirror of itself 
(i.e., symmetric around its center).

'''

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
# @return {Boolean}

class Solution
    def is_symmetric(root)
        # can't just do an in-order traversal of left and right - both
        # sides need to be same shape
        is_mirror(root.left, root.right)
    end

    def is_mirror(left, right)
        # We want left and right to both be nodes or both nil. Use XOR, which evaluates true only if one is false and one is true, i.e., if asymmetric. 
        return false if !left ^ !right #need logical ! because of how ruby falsy works
        return true if !left && !right
        
        left.val == right.val &&  
            is_mirror(left.left, right.right) && 
            is_mirror(left.right, right.left)
    end
end