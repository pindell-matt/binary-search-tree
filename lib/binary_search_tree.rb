require 'pry'
require 'csv'
require_relative 'node'

class BinarySearchTree
  attr_accessor :root, :duplicate_count

  def initialize
    @root = nil
    @duplicate_count = 0
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

  def csv_header_check(score, title)
    @duplicate_count += 1 if ((score == score) && (title == "title"))
  end

  def csv_duplicate_check(score)
    @duplicate_count += 1 if self.include?(score)
  end

  def node_from_csv(score, title)
    unless csv_header_check(score, title) || csv_duplicate_check(score)
      self.insert(score, title)
    end
  end

  def create_csv_with_headers(headers, file)
    CSV.read(file, headers: headers, write_headers: true,
                   return_headers: true, header_converters: :symbol)
  end

  def create_nodes_from_csv(headers, file)
    csv = create_csv_with_headers(headers, file)
    csv.each do |row|
      score = row[:score].to_i
      title = row[:title].lstrip
      node_from_csv(score, title)
    end
  end

  def load(file)
    csv = create_nodes_from_csv("score, title", file)
    (csv.count - @duplicate_count)
  end

  def all_nodes_at_depth(depth)
    @root.all.find_all do |node|
      node.depth == depth
    end
  end

  def health(depth)
    matches = all_nodes_at_depth(depth)
    matches.map do |node|
      [node.score, node.all.count, percentage(node)]
    end
  end

  def percentage(node)
    raw_percentage = (node.all.count / @root.all.count.to_f) * 100
    raw_percentage.floor
  end

  def leaves
    return 0 if empty?
    @root.all.select { |node| node.is_leaf? }.count
  end

  def height
    return 0 if empty?
    @root.all.max_by { |node| node.depth }.depth
  end

end
