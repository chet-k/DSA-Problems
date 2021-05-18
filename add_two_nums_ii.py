# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        #option 1: reverse lists. O(m+n) time, O(1) extra memory, but have to modify the input lists.
        #option 2: convert each list to int, add, convert result to linked list. BUT no info about 32 bit? long? number of digits could easily exceed integer limit.
        #option 3: to not modify, put each list into a stack.
        
        node1 = l1
        stack1 = []
        while node1:
            stack1.append(node1.val)
            node1 = node1.next
        
        node2 = l2
        stack2 = []
        while node2:
            stack2.append(node2.val)
            node2 = node2.next
        
        l3 = None
        carry = 0
        while len(stack1) > 0 or len(stack2) > 0 or carry == 1:
            
            n1 = 0 if stack1 == [] else stack1.pop(-1)
            n2 = 0 if stack2 == [] else stack2.pop(-1)
            digit = n1 + n2 + carry
            
            carry = 0 if digit < 10 else 1
            
            newNode = ListNode(digit % 10)
            newNode.next = l3
            
            l3 = newNode
        
        return l3
            