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

  def assign_root(node)
    @root = node
  end

  def create_node(score, title)
    Node.new(score, title)
  end

  def insert(score, title)
    node = create_node(score, title)
    empty? ? @root = node : @root.insert(node)
    node.depth
  end

  def max
    return nil if empty?
    @root.max
  end

  def min
    return nil if empty?
    @root.min
  end

  def search(score)
    return nil if empty?
    @root.search(score)
  end

  def include?(score)
    !!search(score)
  end

  def depth_of(score)
    return nil if search(score) == nil
    search(score).depth
  end

  def sort
    return [] if empty?
    @root.sort
  end

  # Score of the node
  # Total number of child nodes including the current node
  # Percentage of all the nodes that are this node or it's children

  def health(depth)
    # find all nodes with matching depth
    sort
    if depth == 0
      [[@root.score, @sorted.count, 100]]
    end

  end

end
