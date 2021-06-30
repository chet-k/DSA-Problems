"""
Given an integer n, return a list of all possible full binary trees with n nodes. 
Each node of each tree in the answer must have Node.val == 0.

Each element of the answer is the root node of one possible tree. 
You may return the final list of trees in any order.

A full binary tree is a binary tree where each node has exactly 0 or 2 children.

"""
require 'byebug'
# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {Integer} n
# @return {TreeNode[]}


def all_possible_fbt(n)
    # debugger
    if n == 1
        [TreeNode.new]
    elsif n.odd?
        add_child_pair(all_possible_fbt(n-2))
    else
        []
    end
end

def add_child_pair(root_list)
    new_list = Set.new
    root_list.each do |root|
        leaves = leaf_nodes(root)
        leaves.each do |leaf|
            debugger
            # puts "root: #{root}"

            leaf.left, leaf.right = TreeNode.new, TreeNode.new
            new_list << tree_dup(root)
            # puts "new tree: #{new_list[-1]}"
            
            leaf.left, leaf.right = nil, nil
            # puts "reverted root: #{root}"
        end
    end

    new_list.to_a
end

def leaf_nodes(root)
    return [root] unless root.left || root.right
    out = []
    out += leaf_nodes(root.left) if root.left
    out += leaf_nodes(root.right) if root.right
    
    out
end

# better way would be to add a deep_dup method to the TreeNode class
def tree_dup(old_node)
    node = TreeNode.new
    node.val = old_node.val.dup
    node.right = tree_dup(old_node.right) if old_node.right
    node.left = tree_dup(old_node.left) if old_node.left

    node
end



"""
[[0,0,0,0,0,null,null,0,0],
[0,0,0,0,0,null,null,null,null,0,0],
[0,0,0,0,0,0,0],
[0,0,0,0,0,0,0],
[0,0,0,null,null,0,0,0,0],
[0,0,0,null,null,0,0,null,null,0,0]]

"""