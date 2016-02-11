## Overview

This project uses a Binary Search Tree to organize and store Movies based on an assigned score.

Below is a breakdown of the methods and example use cases.


```ruby
tree = BinarySearchTree.new
```

### `insert`

The `insert` method is used to add new nodes to the structure. Each node contains a score and a movie title. The depth of the node is returned when a node is inserted.

```ruby
tree.insert(61, "Bill & Ted's Excellent Adventure")
# => 0
tree.insert(16, "Transformers 2")
# => 1
tree.insert(92, "Goodfellas")
# => 1
tree.insert(50, "Layer Cake")
# => 2
```

### `include?`

The include? method is used to verify or reject the presence of a score in the tree:

```ruby
tree.include?(16)
# => true
tree.include?(72)
# => false
```

### `depth_of`

Returns the depth of the tree where the submitted score appears. 'nil' is returned if the submitted score does not exist.

```ruby
tree.depth_of(92)
# => 1
tree.depth_of(50)
# => 2
```

### `max`

The max method is used to return the highest-ranked film as a hash comprised of the film's title as the key and it's score as the value.

```ruby
tree.max
# => {"Goodfellas"=>92}
```

### `min`

Similarly, the min method can be used to return a hash containing the title and score of the lowest-ranked film.

```ruby
tree.min
# => {"Transformers 2"=>16}
```

### `sort`

The sort method returns an array of all of the elements of the tree, each represented as the title-score hash and sorted in ascending order (lowest-ranked film to highest).

```ruby
tree.sort
# => [{"Transformers 2"=>16},
#   {"Layer Cake"=>50},
#   {"Bill & Ted's Excellent Adventure"=>61},
#  {"Goodfellas"=>92}]
```

### `load`

The program can also load .txt files that contain scores and titles in the format shown below, it then returns the total count of all films that have been loaded.

```
# movies.txt sample format:
34, The Machinist
63, Watership Down
22, Ali
84, The Thief and the Cobbler
91, The Muppet Movie
10, Fool's Gold
```

```ruby
tree.load('movies.txt')
# => 26
```

The load method will not load any score that is already present in the tree.

### `health`

This method reports the health of the tree by summarizing the number of child nodes (nodes beneath each node) at a given depth. It returns an array containing the following 3 values:

* Film score contained in the node
* Total number of child nodes (including the current node)
* Percentage of all the nodes that are this node or it's children (to indicate whether or not the tree is starting to become unbalanced.)

```ruby
tree.insert(98, "Animals United")
tree.insert(58, "Armageddon")
tree.insert(36, "Bill & Ted's Bogus Journey")
tree.insert(93, "Bill & Ted's Excellent Adventure")
tree.insert(86, "Charlie's Angels")
tree.insert(38, "Charlie's Country")
tree.insert(69, "Collateral Damage")
tree.health(0)
=> [[98, 7, 100]]
tree.health(1)
=> [[58, 6, 85]]
tree.health(2)
=> [[36, 2, 28], [93, 3, 42]]
```
