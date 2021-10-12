=begin
https://leetcode.com/problems/copy-list-with-random-pointer/
https://leetcode.com/submissions/detail/569735185/

Not sure why the LC submission timer says this is so bad. 
This is an O(N) time / space solution, it's only 2 passes.

PASS 1:
  - assign an index to each old node. 
    (via a hash.  need  to get hash[node] = index)
  - create new nodes, deep copying only nexts, not randoms
  - assign an index to each new node 
    (via an array, need to get array[index] = node)
PASS 2:
  - deep-copy randoms: for each old node, get node.random's index 
    via hash[node.random]
  - assign new_node.random via array[index]

=end

# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
  return nil if head.nil?
  old = head
  new = Node.new(old.val)
  old_node_hash, new_node_list = Hash.new, Array.new
  old_index = 0
  while old
    old_node_hash[old] = old_index
    old_index += 1
    new_node_list.push(new)
    new.next = Node.new(old.next.val) if old.next
    old = old.next
    new = new.next
  end
  old, new = head, new_node_list[0]
  while old
    new.random = new_node_list[old_node_hash[old.random]] unless old.random.nil?
    old, new = old.next, new.next
  end
  new_node_list[0]
end

# def print_nodes(head)
#     out = []
#     while head
#         rand = head.random.nil? ? 'null' : head.random.val
#         out << [head.val, rand]
#         head = head.next
#     end
#     p out
# end