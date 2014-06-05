require "minitest/autorun"
require "pry"
require "queue"
require "minitest/pride"

describe "Testing queue data structure"  do

  before do
    @queue = Queue.new
    @node1 = Node.new(1)
    @node2 = Node.new(2)
    @node3 = Node.new(3)
  end

  it "size method returns a count of the item in the queue" do
    count = @queue.count
    size = @queue.size
    size.must_equal count
  end

  it "enqueue method must add an item to the count" do
    @queue.size.must_equal 0
    @queue.enqueue(@node1)
    @queue.size.must_equal 1
    @queue.enqueue(@node2)
    @queue.size.must_equal 2
  end

  it "dequeue method must remove an item from the size" do
    @queue.size.must_equal 0

    5.times do
      @queue.enqueue(@node1)
    end
    @queue.size.must_equal 5
    @queue.dequeue
    @queue.size.must_equal 4

    2.times do
      @queue.dequeue
    end
    @queue.size.must_equal 2
  end

end
