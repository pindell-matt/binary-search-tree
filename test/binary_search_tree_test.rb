require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'
require 'pry'

class BinarySearchTreeTest < Minitest::Test

  def setup
    @tree = BinarySearchTree.new
  end

  def test_can_create_instance_of_binary_search_tree
    assert_kind_of BinarySearchTree, @tree
  end

  def test_tree_initializes_as_empty
    assert @tree.empty?
  end

  def test_tree_initializes_with_root_as_nil
    # skip
    assert_nil @tree.root
  end

  def test_it_inserts_first_node_as_root_and_returns_depth
    # skip
    @tree.insert(81, "Jaws")
    submitted  = @tree.root
    expected = {"Jaws" => 81}

    assert_equal expected, submitted.info
    assert_equal 0, submitted.depth
  end

  def test_second_inserted_node_begins_tree_and_returns_depth
    # skip
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")

    expected = {"Neverending Story" => 55}
    submitted = @tree.root.left_node

    assert_equal expected, submitted.info
    assert_equal 1, submitted.depth
  end

  def test_insert_can_add_to_left_and_right_node
    # skip
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")

    expected_left   = {"Neverending Story" => 55}
    submitted_left  = @tree.root.left_node.info
    expected_right  = {"Goodfellas" => 95}
    submitted_right = @tree.root.right_node.info

    assert_equal expected_left, submitted_left
    assert_equal expected_right, submitted_right
  end

  def test_insert_can_add_twice_to_left_and_right_node
    # skip
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")
    @tree.insert(15, "Transformers 2")
    @tree.insert(90, "Tombstone")

    expected_left   = {"Transformers 2" => 15}
    submitted_left  = @tree.root.left_node.left_node.info
    expected_right  = {"Tombstone" => 90}
    submitted_right = @tree.root.right_node.left_node.info

    assert_equal expected_left, submitted_left
    assert_equal expected_right, submitted_right
  end

  def test_max_returns_node_with_highest_score
    # skip
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")
    @tree.insert(15, "Transformers 2")
    @tree.insert(1, "Lars Von Trier")
    @tree.insert(90, "Tombstone")

    expected = {"Goodfellas" => 95}
    submitted = @tree.max

    assert_equal expected, submitted
  end

  def test_min_returns_node_with_lowest_score
    # skip
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")
    @tree.insert(15, "Transformers 2")
    @tree.insert(1, "Lars Von Trier")
    @tree.insert(90, "Tombstone")

    expected = {"Lars Von Trier" => 1}
    submitted = @tree.min

    assert_equal expected, submitted
  end

  def test_search_returns_matching_node
    # skip
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")
    @tree.insert(15, "Transformers 2")
    @tree.insert(1, "Lars Von Trier")
    @tree.insert(90, "Tombstone")

    expected = {"Transformers 2" => 15}
    submitted = @tree.search(15)

    assert_equal expected, submitted.info
  end

  def test_search_returns_nil_if_no_match
    # skip
    @tree.insert(81, "Jaws")

    expected = nil
    submitted = @tree.search(15)

    assert_equal expected, submitted
  end

  def test_depth_of_returns_depth_of_node
    # skip
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")
    @tree.insert(15, "Transformers 2")
    @tree.insert(1, "Lars Von Trier")
    @tree.insert(90, "Tombstone")

    expected = 3
    submitted = @tree.depth_of(1)

    assert_equal expected, submitted
  end

  def test_depth_of_returns_nil_with_bad_submission
    # skip
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")

    expected = nil
    submitted = @tree.depth_of(1)

    assert_equal expected, submitted
  end

  def test_include_returns_true_or_false
    # skip
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")
    @tree.insert(15, "Transformers 2")
    @tree.insert(1, "Lars Von Trier")
    @tree.insert(90, "Tombstone")

    assert @tree.include?(15)
    refute @tree.include?(100)
  end

  def test_sort_returns_array_of_movie_hashes_in_order
    # skip
    @tree.insert(81, "Jaws")
    @tree.insert(55, "Neverending Story")
    @tree.insert(95, "Goodfellas")
    @tree.insert(75, "Deadpool")
    @tree.insert(15, "Transformers 2")
    @tree.insert(90, "Tombstone")

    submitted = @tree.sort
    expected = [{"Transformers 2"=>15}, {"Neverending Story"=>55},
                {"Deadpool" => 75}, {"Jaws"=>81}, {"Tombstone"=>90},
                {"Goodfellas"=>95}]

    assert_equal expected, submitted
  end

  def test_load_can_load_file_as_csv
    # skip
    @tree.load('./data/movies.txt')

    submitted = @tree.all.count
    expected  = 100

    submitted_root = @tree.root.info
    expected_root_info = {"Hannibal Buress: Animal Furnace"=>"71"}

    assert_equal expected, submitted
    assert_equal expected_root_info, submitted_root
  end

  def test_load_returns_total_count_of_loaded_nodes
    # skip
    submitted = @tree.load('./data/movies.txt')
    expected  = 100

    assert_equal expected, submitted
  end

  def test_health_provides_array_of_values
    # skip
    @tree.insert(98, "Animals United")
    @tree.insert(58, "Armageddon")
    @tree.insert(36, "Bill & Ted's Bogus Journey")
    @tree.insert(93, "Bill & Ted's Excellent Adventure")
    @tree.insert(86, "Charlie's Angels")
    @tree.insert(38, "Charlie's Country")
    @tree.insert(69, "Collateral Damage")

    depth_0       = @tree.health(0)
    expected_at_0 = [[98, 7, 100]]

    depth_1       = @tree.health(1)
    expected_at_1 = [[58, 6, 85]]

    depth_2       = @tree.health(2)
    expected_at_2 = [[36, 2, 28], [93, 3, 42]]

    assert_equal expected_at_0, depth_0
    assert_equal expected_at_1, depth_1
    assert_equal expected_at_2, depth_2
  end

  def test_leaves_returns_count_of_leaf_nodes_on_tree
    # skip
    @tree.insert(98, "Animals United")
    @tree.insert(58, "Armageddon")
    @tree.insert(36, "Bill & Ted's Bogus Journey")
    @tree.insert(93, "Bill & Ted's Excellent Adventure")
    @tree.insert(86, "Charlie's Angels")
    @tree.insert(38, "Charlie's Country")
    @tree.insert(69, "Collateral Damage")

    submitted = @tree.leaves
    expected = 2

    assert_equal expected, submitted
  end

end
