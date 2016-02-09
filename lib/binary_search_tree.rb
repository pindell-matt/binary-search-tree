require_relative 'node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def empty?
    @root == nil
  end

  def insert(score, title)
    node = Node.new(score, title)
    check_root(node)

    node.depth
  end

  def check_root(node)
    if @root == nil
      @root = node
      @root.depth = 0
    end
  end

end
