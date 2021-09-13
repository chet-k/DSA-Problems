=begin
LC 1022 https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/
Timed assessment submission, sub optimal
https://leetcode.com/submissions/detail/553859855/
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
# @return {Integer}
def sum_root_to_leaf(root)
  @path = []
  @sum = 0
  inorder_traverse(root)
  @sum
end

def inorder_traverse(root)
  return unless root
  @path << root.val
  if is_leaf?(root)
    @sum += @path.join('').to_i(2)
  end
  inorder_traverse(root.left)
  inorder_traverse(root.right)
  @path.pop
end

def is_leaf?(node)
  node.left == nil && node.right == nil
end