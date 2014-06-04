require "minitest/autorun"
require "pry"
require "linked_list"

describe "Test linked list"  do

  before do
    @list = List.new
  end

  it "will be able to insert a value to the head" do
    @list.insert_head(2)
    @list.head.value.must_equal 2
  end

  it "will return the amount of nodes in list" do
    node = Node.new(2)
    @list.insert_head(node)
    @list.count.must_equal 1
  end

  it "will search for a given node" do
    node = Node.new(2)
    @list.insert_head(node.value)
    searched_node = @list.search(2)
    searched_node.value.must_equal node.value
  end

  it "will print to a csv string" do
    csv = "12, 'sam', :item, 'tango', 42"
    @list.insert_head(42)
    @list.insert_head('tango')
    @list.insert_head(:item)
    @list.insert_head('sam')
    @list.insert_head(12)
    @list.to_s.must_equal csv
  end

  it "will remove a node" do
    @list.insert_head(42)
    @list.insert_head(40)
    @list.remove(42)
    @list.search(40).value.must_equal 40
    @list.search(42).must_equal nil
  end
end
