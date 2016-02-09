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
    if empty?
      assign_root(node)
    else
      if @root.score > node.score && @root.left_link == nil
        @root.left_link = node
      end
    end
    node.depth
  end

  def assign_root(node)
    @root = node
    @root.depth = 0
  end

  def search(score, node)
    if node == nil || node.score == score
      node
    elsif score < node.score
      seach(score, node.left_link)
    else
      search(score, node.right_link)
    end
  end

  def max
    return nil if empty?
    node = @root
    until node.right_link.nil?
      node = node.right_link
    end
    node.info
  end

  def min
    return nil if empty?
    node = @root
    until node.left_link.nil?
      node = node.left_link
    end
    node.info
  end

end
