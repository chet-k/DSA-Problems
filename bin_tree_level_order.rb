=begin
https://leetcode.com/problems/binary-tree-level-order-traversal/
https://leetcode.com/submissions/detail/574070385/
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
# @return {Integer[][]}
def level_order(root)
  ans = []
  q = []
  q << root if root
  while q.length > 0
    level = []
    next_q = []
    q.each do |node|
      level << node.val
      next_q << node.left if node.left
      next_q << node.right if node.right
    end
    ans << level
    q = next_q
  end
    ans
end