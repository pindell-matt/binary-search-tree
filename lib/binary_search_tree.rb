require_relative 'node'
require 'pry'

class BinarySearchTree
  attr_accessor :root, :sorted

  def initialize
    @root = nil
    @sorted = []
  end

  def empty?
    @root == nil
  end

  def assign_root(node)
    @root = node
  end

  def insert(score, title)
    node = Node.new(score, title)
    if empty?
      @root = node
    else
      @root.insert(node)
    end
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

  def search(score, node=@root)
    return nil if node.nil?
    if node.score == score
      node
    elsif node.score > score
      search(score, node.left_link)
    elsif node.score < score
      search(score, node.right_link)
    end
  end

  def include?(score)
    search(score) ? true : false
  end

  def depth_of(score)
    return nil if search(score) == nil
    search(score).depth
  end

  def inorder(node=@root)
    if node != nil
      inorder(node.left_link)
      @sorted << node.info
      inorder(node.right_link)
    end
  end

  def sort
    inorder
    @sorted
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
