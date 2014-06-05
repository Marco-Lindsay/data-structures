class Queue
  attr_accessor :count, :front, :back

  def initialize
    @count = 0
    @front = nil
    @back = nil
  end

  def size
    @count
  end

  def enqueue(data)
    current_node = Node.new(data)
    @front = current_node if @front.nil?
    @back.pointer = current_node unless @back.nil?
    @back = current_node
    @count += 1

  end

  def dequeue
    raise "There doesnt appear to be anything in your queue" if @front.nil?
    old_front = @front.value
    @front = @front.pointer
    @count -=1
    old_front
  end

end


  class Node
    attr_accessor :value, :pointer

    def initialize(value)
      @value = value
      @pointer = nil
    end
  end
