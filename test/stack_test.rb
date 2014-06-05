require "minitest/autorun"
require "pry"
require "stack"

describe "Testing a stack"  do

  before do
    @stack = Stack.new
    @node = Node.new(2)
  end

  it "will add add one to count when a node is pushed" do
    @stack.count.must_equal 0
    @stack.push(@node)
    @stack.count.must_equal 1
  end

  it "the count will go down when a node is popped" do
    @stack.count.must_equal 0
    5.times do
      @stack.push(@node)
    end
    @stack.count.must_equal 5
  end
end
