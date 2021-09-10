=begin
Submitted as part of mock assessment.
https://leetcode.com/problems/two-sum-bsts/
https://leetcode.com/submissions/detail/552749741/

Given the roots of two binary search trees, root1 and root2, return true if 
and only if there is a node in the first tree and a node in the second tree 
whose values sum up to a given integer target.


(not sure I like this question since the fastest solution O(N1 + N2) time 
doesn't need to take advantage of the properties of BST)
=end


def two_sum_bs_ts(root1, root2, target)
  nums1 = bst_to_sorted_arr(root1) # O(N) time + space
  nums2 = Set.new(bst_to_sorted_arr(root2)) # O(N) time + space
  nums1.each {|el| return true if nums2.include?(target - el)} # O(N) time O(1) + space
  false
end

def bst_to_sorted_arr(root)
  out = []
  stack = []
  node = root
  while true
    if node
      stack.push(node)
      node = node.left
    elsif !stack.empty?
      node = stack.pop
      out << node.val
      node = node.right
    else
      break
    end
  end
  out
end