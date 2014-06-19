class BinarySearchTree
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end

  def insert(value)
    new_tree = BinarySearchTree.new(value)
    new_tree_value = new_tree.value
    if new_tree_value < @value
      if @left.nil?
        @left = new_tree
      else
        @left.insert(value)
      end
    elsif new_tree_value > @value
      if @right.nil?
        @right = new_tree
      else
        @right.insert(value)
      end
    else
      raise "Please no duplicate values!"
    end
  end

  def contains(value, results = [])
    if @value == value
      results << true
    else
      results << false
    end
    @right.contains(value, results) if @right
    @left.contains(value, results) if @left
    if results.include? true
      true
    else
      false
    end
  end

  def size(count = [])
    count << 1
    @left.size(count) if @left
    @right.size(count) if @right
    count.size
  end

  def depth
      [@left, @right].collect {|v| v.nil? ? 1 : v.depth + 1}.max
  end

  def balance
    @left ? left_side = @left.depth :  left_side = 0
    @right ? right_side = (@right.depth) * -1 : right_side = 0
    left_side + right_side
  end

end
