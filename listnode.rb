class ListNode
    attr_accessor :val, :next
    
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end

    def self.array_to_list(arr)
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

    def self.list_to_array(node)
        arr = []
        while node
            arr << node.val
            node = node.next
        end

        arr
    end    
end

