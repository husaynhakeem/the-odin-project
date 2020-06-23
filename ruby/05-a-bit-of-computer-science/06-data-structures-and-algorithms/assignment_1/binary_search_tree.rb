require_relative 'node'
require 'set'

class BinarySearchTree

  attr_reader :root

  def initialize(array = [])
    @root = build_tree(array)
    puts @root
  end

  public

  def build_tree(array)
    unique_sorted_array = sort(remove_dupes(array))
    build_tree_internal(unique_sorted_array)
  end

  def inorder
    result = []
    inorder_internal(@root, result)
    result
  end

  def preorder
    result = []
    preorder_internal(@root, result)
    result
  end

  def postorder
    result = []
    postorder_internal(@root, result)
    result
  end

  def to_s
    inorder.to_s
  end

  def depth
    depth_internal(@root)
  end

  def level_order
    queue = []
    queue << [@root, 1]
    result = []

    until queue.empty?
      node, level = queue.shift
      if block_given?
        yield node.value, level
      else
        result << [node.value, level]
      end

      queue << [node.left, level + 1] unless node.left.nil?
      queue << [node.right, level + 1] unless node.right.nil?
    end

    unless block_given?
      result
    end
  end

  def find(value)
    find_internal(@root, value)
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
    else
      insert_internal(@root, value)
    end
  end

  private

  def remove_dupes(array)
    set = array.to_set
    set.to_a
  end

  def sort(array)
    array.sort
  end

  def build_tree_internal(array)
    if array.empty?
      nil
    else
      middle = array.length / 2
      root = Node.new(array[middle])
      root.left = build_tree_internal(array[0..(middle - 1)]) if middle > 0
      root.right = build_tree_internal(array[(middle + 1)..])
      root
    end
  end

  def inorder_internal(node, result)
    unless node.nil?
      inorder_internal(node.left, result)
      result << node.value
      inorder_internal(node.right, result)
    end
  end

  def preorder_internal(node, result)
    unless node.nil?
      result << node.value
      preorder_internal(node.left, result)
      preorder_internal(node.right, result)
    end
  end

  def postorder_internal(node, result)
    unless node.nil?
      postorder_internal(node.left, result)
      postorder_internal(node.right, result)
      result << node.value
    end
  end

  def depth_internal(node)
    if node.nil?
      0
    else
      left_depth = depth_internal(node.left)
      right_depth = depth_internal(node.right)
      1 + [left_depth, right_depth].max
    end
  end

  def find_internal(node, value)
    if node.nil?
      nil
    elsif node.value == value
      node
    elsif node.value < value
      find_internal(node.right, value)
    else
      find_internal(node.left, value)
    end
  end

  def insert_internal(node, value)
    if node.value < value
      if node.right.nil?
        node.right = Node.new(value)
      else
        insert_internal(node.right, value)
      end
    else
      if node.left.nil?
        node.left = Node.new(value)
      else
        insert_internal(node.left, value)
      end
    end
  end
end