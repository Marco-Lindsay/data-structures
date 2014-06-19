class BinarySearchTree
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = NullBst.new(self)
    @right = NullBst.new(self)
    @@output = []
  end

  def insert(value)
    if value < @value
      @left.insert(value)
    elsif value > @value
      @right.insert(value)
    else
      raise "Please no duplicate values!"
    end
  end

  def contains(value)
    if @value == value
      true
    else
      if value < @value
        @left.contains(value)
      else
        @right.contains(value)
      end
    end
  end

  def size
    @left.size + @right.size + 1
  end

  def depth
    1 + [@left.depth, @right.depth].max
  end

  def balance
    @left.depth - @right.depth
  end

  def post_order
    @left.post_order if @left
    @right.post_order if @right
    @@output << value
    @@output
  end

  def pre_order
    @@output << value
    @left.pre_order if @left
    @right.pre_order if @right
    @@output
  end

  def in_order
    left.in_order if left
    @@output << value
    right.in_order if right
    @@output
  end

end

class NullBst
  attr_reader :parent

  def initialize(parent)
    @parent = parent
  end

  def insert(value)
    if value < @parent.value
      @parent.left = BinarySearchTree.new(value)
    else value > @parent.value
      @parent.right = BinarySearchTree.new(value)
    end
  end

  def contains(value)
    false
  end

  def size
    0
  end

  def depth
    0
  end

  def post_order
  end

  def pre_order
  end

  def in_order
  end

end
