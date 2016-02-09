require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require 'pry'

class NodeTest < Minitest::Test

  def test_can_create_instance_of_node
    root = Node.new(81, "Jaws")

    assert_kind_of Node, root
  end

  def test_node_initializes_with_score_and_title
    root           = Node.new(81, "Jaws")
    expected_score = 81
    expected_title = "Jaws"

    assert_equal expected_score, root.score
    assert_equal expected_title, root.title
  end

  def test_node_initializes_with_left_and_right_links_as_nil
    root           = Node.new(81, "Jaws")
    expected_left  = nil
    expected_right = nil

    assert_nil expected_left
    assert_nil expected_right
  end


end
