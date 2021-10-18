=begin
https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/
https://leetcode.com/submissions/detail/570313586/

=end

# NlogN time solution, obvious but O(N) should be possible using stack.

def bst_from_preorder(preorder)
  root = TreeNode.new(preorder[0])
  preorder[1..-1].each do |val|
    insert_bst(root, val)
  end
  root
end

def insert_bst(root, val)
  if val > root.val
    if root.right.nil?
      root.right = TreeNode.new(val)
    else
      insert_bst(root.right, val)
    end
  else
    if root.left.nil?
      root.left = TreeNode.new(val)
    else
      insert_bst(root.left, val)
    end
  end
end