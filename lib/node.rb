require 'pry'

class Node
  attr_reader :score, :title
  attr_accessor :left_link, :right_link

  def initialize(score, title)
    @score      = score
    @title      = title
    @left_link  = nil
    @right_link = nil
  end

end
