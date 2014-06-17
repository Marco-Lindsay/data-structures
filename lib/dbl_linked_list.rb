# require "pry"
class List
  attr_accessor :head, :tail, :count

  def initialize
    @head = nil
    @tail = nil
    @count = 0
  end

  def size
    @count
  end

  def add(value)
    current_node = Node.new(value)
    if @head.nil?
      @head = current_node
      @tail = current_node
    else
      current_node.prev_node = @tail
      @tail.next_node = current_node
      @tail = current_node
    end
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

    def deduplicate_array
      list = List.new
      self.to_s.split(",").map(&:to_i).uniq.each {|num| list.add(num)}
      list
    end

    def deduplicate
      pointer = @head
      new_list = List.new
        while  pointer != nil
          if new_list.search(pointer.value) == nil
            new_list.add(pointer.value)
          end
          pointer = pointer.next_node
        end
      new_list
    end

    private

    def empty?
      @head == nil
    end

end


  class Node
    attr_accessor :value, :next_node, :prev_node

    def initialize(value)
      @value = value
      @next_node = nil
      @prev_node = nil
    end
  end
