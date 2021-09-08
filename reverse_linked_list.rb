'''
https://leetcode.com/submissions/detail/551015245/
https://leetcode.com/problems/reverse-linked-list/

Given the head of a singly linked list, reverse the list, and return the reversed list.



'''

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end

# Technically it's an O(N) time solution with constant memory but not exactly 
# optimal. Just need a temp variable and one pointer, instead of three pointsers

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
    return head if head.nil? || head.next.nil?
    n1, n2, n3 = head, head.next, head.next.next
    n1.next = nil
    while n3
        n2.next = n1
        n1, n2, n3 = n2, n3, n3.next
    end
    n2.next = n1
    n2
end