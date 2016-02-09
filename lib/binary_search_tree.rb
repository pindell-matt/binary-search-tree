require_relative 'node'
require 'pry'

class BinarySearchTree

  def insert(score, title)
    Node.new(score, title)
  end

end
