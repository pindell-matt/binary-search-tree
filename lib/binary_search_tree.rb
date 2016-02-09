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

  def insert(score, title)
    node = Node.new(score, title)
    assignment_path(node)
    node.depth
  end

  def assignment_path(node)
    if empty?
      assign_root(node)
    elsif node.score > @root.score
      assign_right(@root, node)
    elsif node.score < @root.score
      assign_left(@root, node)
    end
  end

  def assign_left(current, submitted)
    if current.score > submitted.score && current.left_link == nil
      submitted.depth += 1
      current.left_link = submitted
    elsif current.score > submitted.score && current.left_link != nil
      submitted.depth += 1
      current = current.left_link
      assign_left(current, submitted)
    end
  end

  def assign_right(current, submitted)
    if current.score < submitted.score && current.right_link == nil
      submitted.depth += 1
      current.right_link = submitted
    elsif current.score < submitted.score && current.right_link != nil
      submitted.depth += 1
      current = current.right_link
      assign_right(current, submitted)
    end
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
