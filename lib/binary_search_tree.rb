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

  def all
    return [] if empty?
    @root.all
  end

  def load(file_name)
    # return number of movies loaded
  end

  def health(depth)
    # node.all.count
    @root.all.map do |node|
      all = node.all.count
      [node.score, all, percentage(node)]
    end
  end

  def percentage(node)
    ((node.all.count / (@root.all.count.to_f)).round(2) * 100).round
  end

end
