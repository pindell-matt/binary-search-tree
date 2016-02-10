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

  def test_max_returns_largest_node
    @root.insert(Node.new(35, "Nope"))
    @root.insert(Node.new(95, "Casino"))
    @root.insert(Node.new(15, "Nope 2"))

    expected  = {"Casino"=>95}
    submitted = @root.max

    assert_equal expected, submitted
  end
end
