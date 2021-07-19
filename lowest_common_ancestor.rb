'''
# Lowest Common Ancestor of a Binary Search Tree
https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

Given a binary search tree (BST), find the lowest common ancestor (LCA) of 
two given nodes in the BST.

According to the definition of LCA on Wikipedia: 
“The lowest common ancestor is defined between two nodes p and q as the lowest 
node in T that has both p and q as descendants (where we allow a node to be a 
descendant of itself).”
'''

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}


# first attempt, accidentally wrote a solution for case where it's just a binary tree, not 
# a binary SEARCH tree.
def lowest_common_ancestor_binary_tree(root, p, q)
    if root == p || root == q
        root
    elsif tree_contains(root.left, p) && tree_contains(root.left, q)
        lowest_common_ancestor_binary_tree(root.left, p, q)
    elsif tree_contains(root.right, p) && tree_contains(root.right, q)
        lowest_common_ancestor_binary_tree(root.right, p, q)
    else
        root
    end
end

def tree_contains(root, node)
    return false if root == nil
    return true if root == node
    tree_contains(root.left, node) || tree_contains(root.right, node)
end


# second attempt, less optimal readability, do we need recursion?
def lowest_common_ancestor_recursive(root, p, q)
    if p.val < q.val
        a, b = p, q
    else
        a, b = q, p
    end
    
    if root.val < a && root.val < b
        ancestor_helper(root.right, a, b)
    elsif root.val > a && root.val > b
        ancestor_helper(root.left, a, b)
    else
        root
    end
end

def ancestor_helper(root, a, b)
    if root.val < a && root.val < b
        ancestor_helper(root.right, a, b)
    elsif root.val > a && root.val > b
        ancestor_helper(root.left, a, b)
    else
        root
    end
end


# third attempt, neatest to do iteratively
def lowest_common_ancestor(root, p, q)
    if p.val < q.val
        a, b = p, q
    else
        a, b = q, p
    end

    while root
        if root.val < a.val && root.val < b.val
            root = root.right
        elsif root.val > a.val && root.val > b.val
            root = root.left
        else
            return root
        end
    end
end


