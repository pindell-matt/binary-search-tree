require 'pry'

class Node
  attr_reader :score, :title, :info
  attr_accessor :depth, :left_link, :right_link

  def initialize(score, title)
    @score      = score
    @title      = title
    @depth      = 0
    @left_link  = nil
    @right_link = nil
    @info = { title => score }
  end

end
