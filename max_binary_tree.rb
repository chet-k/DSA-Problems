#construct a Cartesian Tree from an array

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} nums
# @return {TreeNode}
def construct_maximum_binary_tree(nums)

    return nil if nums.empty?
    m = nums.max
    i_m = nums.index(m)
    
    root = TreeNode.new(m)
    root.left = construct_maximum_binary_tree(nums[0...i_m])
    root.right = construct_maximum_binary_tree(nums[i_m+1..-1])
    
    root
end

# simple above approach is O(N^2) because on each recursive call we're scanning the entire array for the max.
# we would like to use a heap/sorted array to keep track of the maximum, but we also need to preserve indexing to feed the correct subarray prefix to the recursive calls.
# implement the quadratic way then think about ways to pre-process. 


"""
Wow, O(N) solution is brilliant
https://leetcode.com/problems/maximum-binary-tree/discuss/106146/C++-O(N)-solution


You are given an integer array nums with no duplicates. A maximum binary tree 
can be built recursively from nums using the following algorithm:

Create a root node whose value is the maximum value in nums.
Recursively build the left subtree on the subarray prefix to the left of the maximum value.
Recursively build the right subtree on the subarray suffix to the right of the maximum value.
Return the maximum binary tree built from nums.
"""