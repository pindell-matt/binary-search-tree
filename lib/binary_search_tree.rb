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
    path_from_root(node)
    node.depth
  end

  def path_from_root(node)
    if empty?
      assign_root(node)
    elsif node.score > @root.score
      assign_path(@root, node)
    elsif node.score < @root.score
      assign_path(@root, node)
    end
  end

  def assign_path(current, submitted)
    if current.score > submitted.score && current.left_link == nil
      submitted.depth += 1
      current.left_link = submitted
    elsif current.score > submitted.score && current.left_link != nil
      submitted.depth += 1
      current = current.left_link
      assign_path(current, submitted)
    elsif current.score < submitted.score && current.right_link == nil
      submitted.depth += 1
      current.right_link = submitted
    elsif current.score < submitted.score && current.right_link != nil
      submitted.depth += 1
      current = current.right_link
      assign_path(current, submitted)
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

  def search(score, node=@root)
    if node.score == score
      node
    elsif node.score > score
      search(score, node.left_link)
    elsif node.score < score
      search(score, node.right_link)
    end
  end

  def include?(score)
    search(score).class == Node
  end

  def depth_of(score)
    search(score).depth
  end

end
