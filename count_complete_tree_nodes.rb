=begin
https://leetcode.com/problems/count-complete-tree-nodes/
https://leetcode.com/submissions/detail/576664400/
https://leetcode.com/submissions/detail/576665586/

almost immediatley came up with "here's the O(N) concept, oh it has to be faster,
then that means we count the last row using bin search."

Had harder time with implementing it though. 
=end

def count_nodes(root)
  cur_depth = 0
  last_level = 0
  max_depth = left_depth(root)
  min_depth = right_depth(root)
  return 2**(max_depth) - 1 if max_depth == min_depth
  
  while root
    cur_depth += 1
    if left_depth(root) + cur_depth - 1 == min_depth
      break
    elsif is_full?(root.left)
      last_level += 2**(max_depth - cur_depth - 1)
      root = root.right
    else
      root = root.left
    end
  end
  2**(min_depth) - 1 + last_level
end

def is_full?(node)
  l_depth = left_depth(node)
  r_depth = right_depth(node)
  l_depth > 0 && l_depth == r_depth
end

def left_depth(node)
  d = 0
  while node
    d += 1
    node = node.left
  end
  d
end

def right_depth(node)
  d = 0
  while node
    d += 1
    node = node.right
  end
  d
end