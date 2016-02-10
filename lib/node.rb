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
    if @right_node.nil?
      @right_node = node
    else
      @right_node.insert(node)
    end
  end

  def max
    if @right_node.nil?
      @info
    else
      @right_node.max
    end
  end

  def min
    if @left_node.nil?
      @info
    else
      @left_node.min
    end
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
    if @left_node.nil?
      nil
    else
      @left_node.search(a_score)
    end
  end

  def search_right(a_score)
    if @right_node.nil?
      nil
    else
      @right_node.search(a_score)
    end
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

end
