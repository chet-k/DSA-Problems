'''
https://leetcode.com/submissions/detail/534259063/?from=explore&item_id=3871
https://leetcode.com/problems/n-ary-tree-level-order-traversal/
'''

class Node
    attr_accessor :val, :children
    def initialize(val)
        @val = val
        @children = []
    end
end

# @param {Node} root
# @return {List[List[int]]}
def levelOrder(root)
    out = []
    return out unless root
    
    cur_level = [root]
    next_level = []
    
    until cur_level.empty?
        cur_level.each do |node|
            node.children.each { |child| next_level << child }
        end
        
        out << cur_level.map(&:val)
        
        cur_level = next_level
        next_level = []
    end
    
    out
end