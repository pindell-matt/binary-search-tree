require 'pry'

class Node
  attr_reader :score, :title
  attr_accessor :depth, :left_link, :right_link

  def initialize(score, title)
    @score      = score
    @title      = title
    @depth      = depth
    @left_link  = nil
    @right_link = nil
  end

end
