class Tree
attr_accessor :value, :left, :right

def initialize(value, left=nil, right=nil)
  @value = value
  @left = left
  @right = right
  @@output = []
end

def pre_order
  @@output << value
  left.pre_order if left
  right.pre_order if right
  @@output
end

def post_order
  left.post_order if left
  right.post_order if right
  @@output << value
  @@output
end

def in_order
  left.in_order if left
  @@output << value
  right.in_order if right
  @@output
end

end
