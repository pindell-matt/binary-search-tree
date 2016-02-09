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

  def test_tree_initializes_as_empty
    assert @tree.empty?
  end

  def test_tree_initializes_with_root_as_nil
    assert_nil @tree.root
  end

  def test_it_inserts_first_node_as_root
    @tree.insert(81, "Jaws")
    submitted  = @tree.root
    expected = {"Jaws" => 81}

    assert_equal expected, submitted.info
    assert_equal 0, submitted.depth
  end

end
