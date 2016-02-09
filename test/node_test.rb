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

  def test_node_initializes_with_left_and_right_links_as_nil
    assert_nil @root.left_link
    assert_nil @root.right_link
  end

  def test_node_initializes_with_depth_as_nil
    assert_nil @root.depth
  end

  def test_node_returns_info_as_hash
    expected = {"Jaws" => 81}

    assert_kind_of Hash, @root.info
    assert_equal expected, @root.info
  end

  def test_node_can_set_second_node_as_left_link
    left_node = Node.new(35, "Casino")
    @root.left_link = left_node

    assert_equal left_node, @root.left_link
  end
end
