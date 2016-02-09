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

  def test_insert_can_add_twice_to_left_and_right_link
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")
    @tree.insert(15, "Transformers 2")
    @tree.insert(90, "Tombstone")

    expected_left   = {"Transformers 2" => 15}
    submitted_left  = @tree.root.left_link.left_link.info
    expected_right  = {"Tombstone" => 90}
    submitted_right = @tree.root.right_link.left_link.info

    assert_equal expected_left, submitted_left
    assert_equal expected_right, submitted_right
  end

  def test_max_returns_node_with_highest_score
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")
    @tree.insert(15, "Transformers 2")
    @tree.insert(1, "Lars Von Trier")
    @tree.insert(90, "Tombstone")

    expected = {"Goodfellas" => 95}
    submitted = @tree.max

    assert_equal expected, submitted
  end

  def test_min_returns_node_with_lowest_score
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")
    @tree.insert(15, "Transformers 2")
    @tree.insert(1, "Lars Von Trier")
    @tree.insert(90, "Tombstone")

    expected = {"Lars Von Trier" => 1}
    submitted = @tree.min

    assert_equal expected, submitted
  end

  def test_search_returns_matching_node
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")
    @tree.insert(15, "Transformers 2")
    @tree.insert(1, "Lars Von Trier")
    @tree.insert(90, "Tombstone")

    expected = {"Transformers 2" => 15}
    submitted = @tree.search(15)

    assert_equal expected, submitted.info
  end

  def test_depth_of_returns_depth_of_node
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")
    @tree.insert(15, "Transformers 2")
    @tree.insert(1, "Lars Von Trier")
    @tree.insert(90, "Tombstone")

    expected = 3
    submitted = @tree.depth_of(1)

    assert_equal expected, submitted
  end

end
