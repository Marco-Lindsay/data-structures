require "minitest/autorun"
require 'pry'
require "dbl_linked_list"
require "minitest/pride"

describe "Test doubly linked list"  do

  before do
    @list = List.new
  end

  it "will be able to insert a value to the head" do
    @list.add(2)
    @list.head.value.must_equal 2
    @list.tail.value.must_equal 2
    @list.add(3)
    @list.head.value.must_equal 2
    @list.tail.value.must_equal 3
    @list.add(4)
    @list.head.value.must_equal 2
    @list.tail.value.must_equal 4
  end

  it "will remove a node" do
    @list.add(42)
    @list.add(40)
    @list.remove(42)
    @list.search(40).value.must_equal 40
    @list.search(42).must_equal nil
  end

  it "will return the amount of nodes in list" do
    node = Node.new(2)
    @list.add(node)
    @list.count.must_equal 1
  end

  it "will search for a given node" do
    node = Node.new(2)
    @list.add(node.value)
    searched_node = @list.search(2)
    searched_node.value.must_equal node.value
  end

end

describe "it should have no duplicates" do

  before do
    @list = List.new
    @short_list = List.new
    @array = []

    (1..10).each do |num|
      @short_list.add(num)
    end

    100.times { @array << rand(100)}
    @array.each do |n|
      @list.add(n)
    end
    @short_list.add(5)
  end

  it "its size is what it should be" do
    @short_list.size.must_equal 11
    @list.size.must_equal 100
  end

  it "will not have any duplicates" do
    no_dup = "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
    unique_chomped = @array.uniq.to_s.chomp(']').reverse.chomp('[').reverse
    assert_equal unique_chomped, @list.deduplicate_array.to_s
    assert_equal no_dup, @short_list.deduplicate_array.to_s
  end

  it "will not have any duplicates" do
    no_dup = "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
    unique_chomped = @array.uniq.to_s.chomp(']').reverse.chomp('[').reverse
    assert_equal unique_chomped, @list.deduplicate.to_s
    assert_equal no_dup, @short_list.deduplicate.to_s
  end
end
