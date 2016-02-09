require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'
require 'pry'

class BinarySearchTreeTest < Minitest::Test

  def setup
    @tree = BinarySearchTree.new
  end

  def test_can_create_instance_of_binary_search_tree
    assert_kind_of BinarySearchTree, @tree
  end

  def test_it_can_insert_node
    # binding.pry
  end

end
