# Last in first out
# push pop top is_empty -> operations
# implementations - > array, dynamic array, list - tail (last), list - head (last)
require_relative 'list'
list = List.linked_list

# tail implementation
class Stack < List
    attr_accessor :head
    def initialize(head = nil)
        @head = head
    end

    def push(value)
        @head = List.new(value, head)
    end

    def pop
        if head.nil?
            p "this stack is empty"
        else    
            value = head.value
            @head = head.next
            return value
        end
    end

    def top
        return nil if head.nil?
        return head.value
    end

    def is_empty
        return head == nil
    end
end

p list.length
stack = Stack.new(list)
stack.push(87)
p stack.top
p stack.pop
p stack.pop
p stack.length(stack.head)
