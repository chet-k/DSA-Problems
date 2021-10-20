=begin
https://leetcode.com/problems/binary-tree-maximum-path-sum/
https://leetcode.com/submissions/detail/574051341/

It works - isn't super pretty but stuck with it and solved an LC hard in
not too much time
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
def max_path_sum(root)
  dp = make_path_sum_dp(root, TreeNode.new(root.val))
  traverse_dp(root, dp, dp.val)
end

def make_path_sum_dp(node, dp)
  if node.left
    dp.left = make_path_sum_dp(node.left, TreeNode.new(node.left.val))
  end
  if node.right
    dp.right = make_path_sum_dp(node.right, TreeNode.new(node.right.val))
  end
  left_sum = dp.left.nil? ? 0 : dp.left.val
  right_sum = dp.right.nil? ? 0 : dp.right.val
  path_sum = [left_sum, right_sum].max
  dp.val += path_sum if path_sum > 0
  dp
end

def traverse_dp(node, dp, cur_max)
  return cur_max unless node
  # calculate max path sum excluding parent. Update max if greater
  exclusive_sum = node.val 
  exclusive_sum += dp.left.val if dp.left && dp.left.val > 0
  exclusive_sum += dp.right.val if dp.right && dp.right.val > 0
  new_max = [cur_max, exclusive_sum].max
  # recursively continue down rest of tree
  new_max = traverse_dp(node.left, dp.left, new_max)
  new_max = traverse_dp(node.right, dp.right, new_max)
  new_max
end

=begin
at a given node, we can either include the node plus left path or node plus right path. 
We can only include both if we exclude parent node and the rest of the tree connected above, 
    because of the rule prohibiting using the same node twice.

Initial thought: build a DP tree. each node is the max path including the corresponding node in the input tree.

Trick is going through the DP tree on a second pass:
At a current node, is it better to take the current max, or add together the cur node + left path + right path?


#traverse input tree and create DP tree
# Currently, dp is a tree where the value of each node equals the max path of either the left or right subtree.... ONLY IF the parent node is included. 
    # Next, we need to traverse dp to look for cases where excluding a node's parent would be better.
=end