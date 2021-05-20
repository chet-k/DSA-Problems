class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

class Solution

    def better_merge_two_lists(l1, l2)
        node = ListNode.new()
        root = node
        while l1 && l2
            if l1.val < l2.val
                node.next = l1
                l1 = l1.next
            else
                node.next = l2
                l2 = l2.next
            end
            node = node.next
        end
        node.next = l1 || l2
        root.next
    end
    
    def merge_two_lists(l1, l2)
        
        return l2 if not l1
        return l1 if not l2
        
        if l1.val <= l2.val
            l3 = l1
            l1 = l1.next
        else
            l3 = l2
            l2 = l2.next
        end
        
        head = ListNode.new(0)
        head.next = l3
        
        while l1 || l2
            if not l1
                l3.next = l2
                l2 = l2.next
            elsif not l2
                l3.next = l1
                l1 = l1.next
            elsif l1.val <= l2.val
                l3.next = l1
                l1 = l1.next
            else
                l3.next = l2
                l2 = l2.next
            end
            l3 = l3.next
        end
        
        head.next
    end

    def array_to_list(arr)
        return nil unless arr.length > 0

        head = ListNode.new(0)
        node = ListNode.new(arr.first)
        head.next = node

        arr[1..-1].each do |n|
            node.next = ListNode.new(n)
            node = node.next
        end

        head.next
    end

    def list_to_array(node)
        arr = []
        while node
            arr << node.val
            node = node.next
        end

        arr
    end
end

# sol = Solution.new

# l1 = sol.array_to_list([1,2,4])
# l2 = sol.array_to_list([1,3,4])

# l3 = sol.merge_two_lists(l1, l2)
# p sol.list_to_array(l3)