=begin
Is the tree a valid BST?

https://leetcode.com/problems/validate-binary-search-tree/
https://leetcode.com/submissions/detail/559991948

Given the root of a binary tree, determine if it is a valid binary search tree (BST).

A valid BST is defined as follows:
  The left subtree of a node contains only nodes with keys less than the node's key.
  The right subtree of a node contains only nodes with keys greater than the node's key.
  Both the left and right subtrees must also be binary search trees.
=end

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
def is_valid_bst(root) 
  return true if root.nil?
  low = -Float::INFINITY
  hi = Float::INFINITY
  bst_helper(root.left, low, root.val) && bst_helper(root.right, root.val, hi)
end

def bst_helper(node, min, max)
  return true if node.nil?
  node.val > min && 
    node.val < max && 
    bst_helper(node.left, min, node.val) &&
    bst_helper(node.right, node.val, max)
end