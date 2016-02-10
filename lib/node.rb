require 'pry'

class Node
  attr_reader :score, :title, :info, :left_node, :right_node
  attr_accessor :depth

  def initialize(score, title)
    @score      = score
    @title      = title
    @depth      = 0
    @left_node  = nil
    @right_node = nil
    @info = { title => score }
  end

  def insert(node)
    node.depth = self.depth + 1
    if score > node.score
      insert_left(node)
    else
      insert_right(node)
    end
  end

  def insert_left(node)
    @left_node.nil? ? @left_node = node : @left_node.insert(node)
  end

  def insert_right(node)
    @right_node.nil? ? @right_node = node : @right_node.insert(node)
  end

  def max
    @right_node.nil? ? @info : @right_node.max
  end

  def min
    @left_node.nil? ? @info : @left_node.min
  end

  def search(a_score)
    return self if @score == a_score
    if @score > a_score
      search_left(a_score)
    else
      search_right(a_score)
    end
  end

  def search_left(a_score)
    @left_node.nil? ? nil : @left_node.search(a_score)
  end

  def search_right(a_score)
    @right_node.nil? ? nil : @right_node.search(a_score)
  end

  def sort
    [sorted_left, @info, sorted_right].flatten.compact
  end

  def sorted_left
    @left_node.sort unless @left_node.nil?
  end

  def sorted_right
    @right_node.sort unless @right_node.nil?
  end

  def all
    [all_left, self, all_right].flatten.compact
  end

  def all_left
    @left_node.all unless @left_node.nil?
  end

  def all_right
    @right_node.all unless @right_node.nil?
  end

end
