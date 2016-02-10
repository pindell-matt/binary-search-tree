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
    # load as csv
    # read through each line
    # => insert node
    # return number of movies loaded (node.all.count)
  end

  def depth_match(depth)
    @root.all.find_all do |node|
      node.depth == depth
    end
  end

  def health(depth)
    matches = depth_match(depth)
    matches.map do |node|
      [node.score, node.all.count, percentage(node)]
    end
  end

  def percentage(node)
    ((node.all.count / (@root.all.count.to_f)) * 100).floor
  end

end
