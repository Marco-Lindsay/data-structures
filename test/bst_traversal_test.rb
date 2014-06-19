require "minitest/autorun"
require 'pry'
require "bst"
require "minitest/pride"

describe "binary tree traversal methods" do

  before do
    @tree = BinarySearchTree.new(10)
    @tree.insert(13)
    @tree.insert(14)
    @tree.insert(11)
    @tree.insert(7)
    @tree.insert(9)
    @tree.insert(6)
  end

  it "should have a post order traversal method" do
    @tree.post_order.must_equal [6, 9, 7, 11, 14, 13, 10]
  end

  it "should have a pre order traversal method" do
    @tree.pre_order.must_equal [10, 7, 6, 9, 13, 11, 14]
  end

  it "should have a in order traversal method" do
    @tree.in_order.must_equal [6, 7, 9, 10, 11, 13, 14]
  end
  #
  # it "should have a breadth first method" do
  # end

end
