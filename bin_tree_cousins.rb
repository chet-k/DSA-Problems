=begin
https://leetcode.com/problems/cousins-in-binary-tree/
https://leetcode.com/submissions/detail/573362176/

Method 1: DFS
search tree for x with simple traversal. note depth and parent.
search tree for y with simple traversal. note depth and parent. 
    (optimize: skip nodes with depth > x_depth)
return true if depth same and parent not same, false otherwise.
O(N) time, O(1) memory.
-> simple concept, still BCR time and space
-> extra variables to track (parent, depth)

Method 2: BFS
traverse tree level by level using queue, and heck each node's children for x / y
-> more code complexity
-> worst case time still O(N), memory now O(N) instead of O(1)
-> BUT in best case, we don't have to traverse the whole depth of the tree.
    (after implementing, I realize this benefit is moot practically speaking. 
      If the tree were so big that we cared about this special case, would we 
      even bother considering a solution using O(N) memory??)
=end

#DFS implementation:
def is_cousins(root, x, y)
  return false if root.val == x || root.val == y
  q, next_q = [root], []
  x_found, y_found = false, false
  while q.length > 0
    q.each do |node|
      left, right = node.left, node.right
      if left
        if left.val == x 
          return false if !right.nil? && right.val == y
          x_found = true
        elsif left.val == y
          return false if !right.nil? && right.val == x
          y_found = true
        else
          next_q.push(left) 
        end
      end
      if right
        if right.val == x
          x_found = true 
        elsif right.val == y
          y_found = true
        else
          next_q.push(right)
        end
      end
    end
    if x_found || y_found
      q = []
    else
      q = next_q
      next_q = []
    end
  end
  x_found && y_found
end