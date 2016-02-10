require 'pry'

class Node
  attr_reader :score, :title, :info, :left_link, :right_link
  attr_accessor :depth

  def initialize(score, title)
    @score      = score
    @title      = title
    @depth      = 0
    @left_link  = nil
    @right_link = nil
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
    @left_link.nil? ? @left_link = node : @left_link.insert(node)
  end

  def insert_right(node)
    if @right_link.nil?
      @right_link = node
    else
      @right_link.insert(node)
    end
  end

  def max
    if @right_link.nil?
      @info
    else
      @right_link.max
    end
  end

  def min
    if @left_link.nil?
      @info
    else
      @left_link.min
    end
  end
  
end
