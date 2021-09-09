=begin
submitted as part of mock assessment
https://leetcode.com/submissions/detail/551804341/
https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/
Given the root of a Binary Search Tree (BST), convert it to a Greater Tree such 
that every key of the original BST is changed to the original key plus sum of 
all keys greater than the original key in BST.

As a reminder, a binary search tree is a tree that satisfies these constraints:

The left subtree of a node contains only nodes with keys less than the node's key.
The right subtree of a node contains only nodes with keys greater than the node's key.
Both the left and right subtrees must also be binary search trees.
Note: This question is the same as 538: https://leetcode.com/problems/convert-bst-to-greater-tree/


Constraints:

The number of nodes in the tree is in the range [1, 100].
0 <= Node.val <= 100
All the values in the tree are unique.
root is guaranteed to be a valid binary search tree.
=end


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
# @return {TreeNode}
def bst_to_gst(root)
    @running_sum = 0
    gst_helper(root)
    root
end
    
def gst_helper(root)
    return unless root
    gst_helper(root.right)
    @running_sum += root.val
    root.val = @running_sum
    gst_helper(root.left)
end