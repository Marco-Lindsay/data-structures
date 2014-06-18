require "minitest/autorun"
require "minitest/pride"
require "pry"
require "hash"

describe "hash tests" do
  before do
    @hash = HashTable.new(1024)
  end

  it "should be a fixed size" do
    @hash.hash_table.length.must_equal 1024
  end

  it "will only accept strings as key" do
    err = -> { @hash.set(42, 'test')}.must_raise(RuntimeError)
    err.message.must_match /Key must be a string!/
  end

  it "should hash the key properly" do
    @hash.hasher("key").must_equal 329
  end

  it " should store the given key using the given value" do
    @hash.set("key", "value")
  end

  it "should get the value for a given key" do
    @hash.set("key", "value")
    @hash.get("key").must_equal("value")
  end

  it "should handle collisions with style" do
    @hash.set("marco", "name")
    @hash.set("ocram", "back_name")
    assert_equal @hash.hasher("marco"), @hash.hasher("ocram")
    assert_equal @hash.get("marco"), "name"
    assert_equal @hash.get("ocram"), "back_name"
  end


end
