# First in First out
# enqueue dequeue peek is_empty -> Operations
# implementations -> array, circular array*, head-front tail-last list
require_relative 'list'
list = List.linked_list
p list.length

class Queues < List
    attr_accessor :front, :back

    def initialize(head = nil)
        @front = head
        @back = last_element(head)
    end

    def enqueue(value)
        new_back = List.new(value, nil)
        if back != nil
            @back.next = new_back
            @back = new_back
        else
            @front = new_back
            @back = new_back
        end
    end

    def dequeue
        if front != nil
            value = @front.value
            @front = front.next
            return value
        else
            "this queue is empty"
        end
    end

    def peek
        return nil if front.nil?
        front.value
    end

    def is_empty
        head == nil
    end

    private
    
    def last_element(head)
        if head == nil
            return nil
        elsif head.next == nil 
            return head
        else
            last_element(head.next)
        end
    end
end

queue = Queues.new(list)
queue.enqueue(rand(1..1000))
p queue.peek
p queue.dequeue
p queue.peek
p queue.dequeue
p queue.dequeue
p queue.length(queue.front)
