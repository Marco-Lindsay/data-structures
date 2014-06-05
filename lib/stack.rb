class Stack
  attr_accessor :head, :count

  def initialize
    @count = 0
  end

  def push(value)
    current_node = Node.new(value)
    if @head.nil?
      @head = current_node
    else
      current_node.next_node = @head
      @head = current_node
    end
    @count += 1
  end

  def pop
    if @count == 0
      return nil
    else
      old_head = @head
      @head.next_node = @head
      return old_head.value
    end
    @count -= 1
  end
end
 class Node
    attr_accessor :value, :next_node

    def initialize(value)
      @value = value
      @next_node = nil
    end
  end
