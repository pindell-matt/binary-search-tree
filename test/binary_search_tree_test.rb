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

  def test_second_inserted_node_begins_tree
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")

    expected = {"Neverending Story" => 55}
    submitted = @tree.root.left_link

    assert_equal expected, submitted.info
    assert_equal 1, submitted.depth
  end

  def test_insert_can_add_to_left_and_right_link
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")

    expected_left   = {"Neverending Story" => 55}
    submitted_left  = @tree.root.left_link.info
    expected_right  = {"Goodfellas" => 95}
    submitted_right = @tree.root.right_link.info

    assert_equal expected_left, submitted_left
    assert_equal expected_right, submitted_right
  end

end
