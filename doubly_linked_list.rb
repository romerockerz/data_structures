require_relative 'list'

class Node
    attr_accessor :value, :ahead, :follow

    def initialize(value = nil, follow = nil, ahead = nil)
        @value = value
        @ahead = ahead
        @follow = follow
    end
end

head = Node.new(rand(0..500))

class DoublyLinkedList
    attr_accessor :head

    def initialize(head = nil)
        @head = head
    end

    def self.doubly_linked_list(head)
        generated_numbers = rand(50...500).times.map{ Random.rand(1...1000) }
        generated_numbers.each_with_index do |num, index|
            if index == 0
                @header = head
            else
                current = Node.new(num, @header)
                @header.ahead = current
                @header = current
            end
        end
        head
    end
end

head = DoublyLinkedList.doubly_linked_list(head)

# p head.value
# p head.ahead.follow.value

class Queues
    attr_accessor :front, :back

    def initialize(head = nil)
        @front = head
        @back = last_element(head)
    end

    def enqueue_end(value)
        new_back = Node.new(value, @back)
        if back != nil
            @back.ahead = new_back
            @back = new_back
        else
            @front = new_back
            @back = new_back
        end
    end

    def enqueue_start(value)
        new_front = Node.new(value)
        if front != nil
            new_front.ahead = @front
            @front.follow = new_front
            @front = new_front
        else
            @front = new_front
            @back = new_front
        end    
    end

    def dequeue_start
        if front != nil
            value = @front.value
            @front = front.ahead
            return value
        else
            "this queue is empty"
        end
    end

    def dequeue_end
        if back != nil && back != front
            new_back = @back.follow
            value = @back.value
            @back = new_back
            @back.ahead = nil
            return value
        elsif back == front && back !=nil
            value = @back.value
            back = nil
            front = nil
            return value
        elsif back == nil && front == nil 
            "this queue is empty"  
        end
    end

    def peek
        return nil if front.nil?
        front.value
    end

    def is_empty
        front == nil
    end

    private
    
    def last_element(head)
        if head == nil
            return nil
        elsif head.ahead == nil 
            return head
        else
            last_element(head.ahead)
        end
    end
end

queue = Queues.new(head)

p queue.back.value
p queue.front.value
p queue.back.follow.value
p queue.dequeue_end
p queue.back.value

p queue.enqueue_start(88).value
p queue.front.value
