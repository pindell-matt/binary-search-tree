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

  def left_path_check(current, submitted)
    current_greater?(current, submitted) && left_link_open?(current)
  end

  def current_greater?(current, submitted)
    #change to be useable for > / < (based off T/F)
    current.score > submitted.score
  end

  def left_link_open?(node)
    node.left_link.nil?
  end

  def left_path_assign(current, submitted)
    submitted.depth += 1
    current.left_link = submitted
  end

  def repeat_for_left(current, submitted)
    submitted.depth += 1
    current = current.left_link
  end

  def assign_path(current, submitted)
    # Left Path
    if left_path_check(current, submitted)
      left_path_assign(current, submitted)
    elsif current.score > submitted.score && current.left_link != nil
      submitted.depth += 1
      current = current.left_link
      assign_path(current, submitted)
    # Right Path
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
    if node == nil
      nil
    elsif node.score == score
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
    # binding.pry
    # sort_by depth ?

  end

end
