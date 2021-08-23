
# carrying over from common Array version of two sum, the best O(N) way is to 
# traverse entire array and use a hash set to check if complement exists.

# here for kicks I try out two LESS optimal time-wise but O(1) memory solutions 
# that are still less than O(N^2) by taking advantage of BST.

class Solution
  # BFS queue iterative traversal
  def find_target(root, k)
    @root = root
    bst_queue = Queue.new
    bst_queue << root
    while !bst_queue.empty?
      node = bst_queue.deq
      # return true if bst_include_or_path_has_pair?(k - node.val, node)
      return true if bst_include?(k - node.val, node)
      bst_queue << node.left unless node.left.nil?
      bst_queue << node.right unless node.right.nil?
    end
    false
  end

  def bst_include?(n, orig_node)
    node = @root
    while node
      return true if node.val == n && node != orig_node
      node = node.val > n ? node.left : node.right
    end
    false
  end


  # recursive traversal
  def find_target_recursive(root, k)
    @root = root
    @k = k
    traverse_tree(@root)
  end

  def traverse_tree_recursive(node)
    return false if node.nil?
    return true if bst_include?(@k - node.val, node)
    traverse_tree(node.left) || traverse_tree(node.right)
  end

  def bst_include_recursive?(n, orig_node)
    node = @root
    while node
      return true if node.val == n && node != orig_node
      node = node.val > n ? node.left : node.right
    end
    false
  end
end