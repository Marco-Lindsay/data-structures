require "minitest/autorun"
require 'pry'
require "bst"
require "minitest/pride"

describe "binary tree" do
  before do
    @tree = BinarySearchTree.new(4)
  end

  it "will have an insert function" do
    @tree.value.must_equal 4
    @tree.insert(2)
    @tree.left.value.must_equal 2
    @tree.insert(6)
    @tree.right.value.must_equal 6
    err = -> {@tree.insert(6)}.must_raise(RuntimeError)
    err.message.must_match /Please no duplicate values!/
  end

  it "will have a contain method" do
    @tree.contains(4).must_equal true
    @tree.contains(3).must_equal false
    @tree.insert(7)
    @tree.contains(7).must_equal true
  end

  it "size will return the size" do
    assert_equal @tree.size, 1
    @tree.insert(7)
    assert_equal @tree.size, 2
  end

  it "will return the level of depth" do
    assert_equal @tree.depth, 1
    @tree.insert(5)
    assert_equal @tree.depth, 2
    @tree.insert(3)
    assert_equal @tree.depth, 2
    @tree.insert(6)
    assert_equal @tree.depth, 3
  end

  it "will return an integer for how well balanced the tree is" do
    assert_equal @tree.balance, 0
    @tree.insert(5)
    assert_equal @tree.balance, -1
    @tree.insert(6)
    assert_equal @tree.balance, -2
    @tree.insert(1)
    @tree.insert(2)
    @tree.insert(3)
    assert_equal @tree.balance, 1
  end
end
