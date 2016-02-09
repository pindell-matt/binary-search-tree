require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require 'pry'

class NodeTest < Minitest::Test

  def test_can_create_instance_of_node
    root = Node.new(81, "Jaws")

    assert_kind_of Node, root
  end


end
