class List
  attr_accessor :head, :count

  def initialize
    @count = 0
  end

  def size
    @count
  end

  def insert_head(value)
    current_node = Node.new(value)
    current_node.next_node = @head
    @head = current_node
    @count += 1
  end

  def search(value)
    return nil if empty?
    node = @head
    begin
      return node if node.value == value
      node = node.next_node
    end while node != nil
    return nil
  end

  def remove(value)
    if @head.value == value
      @head = @head.next_node
    else
      current_node = @head.next_node
      prior_node = @head
      while current_node
        if current_node.value == value
          prior_node.next_node = current_node.next_node
          current_node = nil
        else
          prior_node = current_node
          current_node = current_node.next_node
        end
      end
    end
  end

    def to_s
      node = @head
      str = ""
      while node != nil
        if node.value.kind_of? Integer or node.value.kind_of? Float
          this_str = "#{node.value}"
        elsif node.value.kind_of? Symbol
          this_str = ":#{node.value}"
        else
          this_str = "'#{node.value}'"
        end
        str += this_str
        str += ", " if node.next_node != nil
        node = node.next_node
      end
      return str
    end

    private

    def empty?
      @head == nil
    end
end


  class Node
    attr_accessor :value, :next_node

    def initialize(value)
      @value = value
      @next_node = nil
    end
  end
