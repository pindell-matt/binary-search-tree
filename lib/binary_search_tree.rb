require_relative 'node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = root
  end

  def insert(score, title)
    node = Node.new(score, title)
    check_root(node)
  end

  def check_root(node)
    # @root = node if @root == nil
    if @root == nil
      @root = node
      @root.depth = 0
    end
  end

end
