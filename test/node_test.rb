require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require 'pry'

class NodeTest < Minitest::Test

  def setup
    @root = Node.new(81, "Jaws")
  end

  def test_can_create_instance_of_node
    assert_kind_of Node, @root
  end

  def test_node_initializes_with_score_and_title
    expected_score = 81
    expected_title = "Jaws"

    assert_equal expected_score, @root.score
    assert_equal expected_title, @root.title
  end

  def test_node_initializes_with_left_and_right_nodes_as_nil
    assert_nil @root.left_node
    assert_nil @root.right_node
  end

  def test_node_initializes_with_depth_as_nil
    assert_equal 0, @root.depth
  end

  def test_node_returns_info_as_hash
    expected = {"Jaws" => 81}

    assert_kind_of Hash, @root.info
    assert_equal expected, @root.info
  end

  def test_insert_can_insert_node
    @root.insert(Node.new(35, "Casino"))

    expected  = {"Casino"=>35}
    submitted = @root.left_node.info

    assert_equal expected, submitted
  end

  def test_max_returns_info_of_largest_node
    @root.insert(Node.new(35, "Nope"))
    @root.insert(Node.new(95, "Casino"))
    @root.insert(Node.new(15, "Nope 2"))

    expected  = {"Casino"=>95}
    submitted = @root.max

    assert_equal expected, submitted
  end

  def test_min_returns_info_of_smallest_node
    @root.insert(Node.new(35, "Nope"))
    @root.insert(Node.new(95, "Casino"))
    @root.insert(Node.new(15, "Nope 2"))

    expected  = {"Nope 2"=>15}
    submitted = @root.min

    assert_equal expected, submitted
  end

  def test_search_returns_matching_node
    @root.insert(Node.new(35, "Nope"))
    @root.insert(Node.new(95, "Casino"))
    @root.insert(Node.new(15, "Nope 2"))

    expected  = {"Casino"=>95}
    submitted = @root.search(95).info

    assert_equal expected, submitted
  end

  def test_sort_returns_array_of_movie_hashes_in_order
    @root.insert(Node.new(35, "Nope"))
    @root.insert(Node.new(95, "Casino"))
    @root.insert(Node.new(15, "Nope 2"))

    expected  = [{"Nope 2"=>15}, {"Nope"=>35},
                 {"Jaws"=>81}, {"Casino"=>95}]
    submitted = @root.sort

    assert_equal expected, submitted
    assert_kind_of Array, submitted
  end

  def test_all_returns_array_of_all_node_objects
    @root.insert(Node.new(35, "Nope"))
    @root.insert(Node.new(95, "Casino"))
    @root.insert(Node.new(15, "Nope 2"))

    expected  = {"Nope 2"=>15}
    submitted = @root.all.first.info

    assert_equal expected, submitted
    assert_kind_of Array, @root.all
  end

  def test_is_leaf
    @root.insert(Node.new(35, "Nope"))
    @root.insert(Node.new(95, "Casino"))
    @root.insert(Node.new(15, "Nope 2"))

    leaf = @root.all.last
    root = @root

    assert leaf.is_leaf?
    refute root.is_leaf?
  end

end
