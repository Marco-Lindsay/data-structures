require "minitest/autorun"
require "pry"
require "tree"

describe "binary tree print methods"  do

  before do
    andrea = Tree.new('Andrea')
    peter  = Tree.new('Peter')
    katie  = Tree.new('Katie', peter, andrea)
    dan    = Tree.new('Dan')
    eddie  = Tree.new('Eddie')
    craig  = Tree.new('Craig')
    phil   = Tree.new('Phil', craig, eddie)
    jony   = Tree.new('Jony', dan, katie)
    @tree    = Tree.new('Tim', jony, phil)
  end

  it "will return a pre order search" do
    @tree.pre_order.must_equal ["Tim", "Jony", "Dan", "Katie", "Peter", "Andrea", "Phil", "Craig", "Eddie"]
  end

  it "will return a post order search" do
    @tree.post_order.must_equal ["Dan", "Peter", "Andrea", "Katie", "Jony", "Craig", "Eddie", "Phil", "Tim"]

  end

  it "will return an in order search" do
    @tree.in_order.must_equal ["Dan", "Jony", "Peter", "Katie", "Andrea", "Tim", "Craig", "Phil", "Eddie"]

  end

end
