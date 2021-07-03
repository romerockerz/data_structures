class ListMethods
    attr_accessor :head  
    def initialize(head)
      @head = head
    end
  
    def length(current = self, count = 1)
        if current == nil
            return "this is an empty list"
        elsif current.next == nil
            return count
        else
            current = current.next    
            count = count + 1
            length(current, count)
        end
    end
        
    def find_an_element(current = self, element = nil, index = 0)
        if current.value == element
            return p "the value is present at index: #{index}"
        elsif current.next.nil?
            return p "This value is not present in our list"    
        else
            current = current.next
            index = index + 1
            find_an_element(current, element, index)
        end
    end
    
    def remove_an_element(postion = 0, index = 0, current = self, head = self)
        if length(head) < postion
            p "this position is out of length of the list"
            return head
        elsif postion == 0
            p postion
            head = current.next
            current.next = nil
            return head
        elsif index == postion - 1 && current.next != nil
            p postion
            current.next = current.next.next
            return head
        elsif current.next.next == nil && index == postion-1
            p postion
            current.next = nil
            return head
        else
            remove_an_element(postion, index + 1, current.next, head)    
        end
    end
            
    def add_an_element(position = 0, new_element = nil, index = 0, current, head)
        size = length(head)
        if position > size
            p "this is outside the list"
            return head
        elsif position == 0
            p position
            new_element.next = head
            head = new_element
            return head
        elsif index == position - 1
            p position
            new_element.next = current.next
            current.next = new_element
            return head
        elsif index == position && position == size - 1
            p position
            current.next = new_element
            return head    
        else
            add_an_element(position, new_element, index + 1, current.next, head)
        end
    end    
    
    def search_a_value(value, index = 0, current, head)
        if current.value == value
            p "the value is #{value}"
            p "this value is present at position #{index}"
            return value
        elsif current.next == nil
            p "the value is #{value}"
            p "this value is not present in the list"
            return value
        else 
            search_a_value(value, index + 1, current.next, head)   
        end    
    end
end

class List < ListMethods
    attr_accessor :value, :next
    def initialize(value, next_element)
        @value = value
        @next =  next_element
    end

    def self.linked_list
        head = List.new(8, nil)
        generated_numbers = rand(50...500).times.map{ Random.rand(1...1000) }
        generated_numbers.each_with_index do |num, index|
            if index == 0
                @header = head
            else
                current = List.new(num, nil)
                @header.next = current
                @header = current
            end
        end
        head
    end
end

new_list_head = List.linked_list
