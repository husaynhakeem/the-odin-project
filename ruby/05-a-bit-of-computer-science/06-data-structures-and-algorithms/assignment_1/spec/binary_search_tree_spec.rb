require_relative '../binary_search_tree'

describe BinarySearchTree do
  describe "#inorder" do
    it "returns the inorder traversal of the binary tree" do
      array = [1, 2, 3, 4, 5, 6, 7, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 7, 3, 4, 2, 2, 4, 5]
      bst = BinarySearchTree.new(array)

      expected = [1, 2, 3, 4, 5, 6, 7]
      expect(bst.inorder).to eql(expected)
    end
  end

  describe "#preorder" do
    it "returns the preorder traversal of the binary tree" do
      array = [1, 2, 3, 4, 5, 6, 7, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 7, 3, 4, 2, 2, 4, 5]
      bst = BinarySearchTree.new(array)

      expected = [4, 2, 1, 3, 6, 5, 7]
      expect(bst.preorder).to eql(expected)
    end
  end

  describe "#postorder" do
    it "returns the postorder traversal of the binary tree" do
      array = [1, 2, 3, 4, 5, 6, 7, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 7, 3, 4, 2, 2, 4, 5]
      bst = BinarySearchTree.new(array)

      expected = [1, 3, 2, 5, 7, 6, 4]
      expect(bst.postorder).to eql(expected)
    end
  end

  describe "#to_s" do
    it "returns the string representation of the binary tree" do
      array = [1, 2, 3, 4, 5, 6, 7, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 7, 3, 4, 2, 2, 4, 5]
      bst = BinarySearchTree.new(array)

      expected = "[1, 2, 3, 4, 5, 6, 7]"
      expect(bst.to_s).to eql(expected)
    end
  end

  describe "#build_tree" do
    it "returns the root node of the built tree. This tree should be balanced and mustn't contain dupes" do
      bst = BinarySearchTree.new
      array = [1, 2, 3, 4, 5, 6, 7, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 7, 3, 4, 2, 2, 4, 5]

      expected = 4
      expect(bst.build_tree(array).value).to eql(expected)
    end
  end

  describe "#depth" do
    it "returns the depth of the BST" do
      array = [1, 2, 3, 4, 5, 6, 7, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 7, 3, 4, 2, 2, 4, 5]
      bst = BinarySearchTree.new(array)

      expected = 3
      expect(bst.depth).to eql(expected)
    end
  end

  describe "#level_order w/ block" do
    it "returns one [node, level] pair at a time from a BFS traversal of the BST" do
      array = [1, 2, 3, 4, 5, 6, 7, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 7, 3, 4, 2, 2, 4, 5]
      bst = BinarySearchTree.new(array)

      bfs = []
      bst.level_order { |value, level| bfs << [value, level] }

      expected = [[4, 1], [2, 2], [6, 2], [1, 3], [3, 3], [5, 3], [7, 3]]
      expect(bfs).to eql(expected)
    end
  end

  describe "#level_order w/o block" do
    it "returns an array of [node, level] pairs from a BFS traversal of the BST" do
      array = [1, 2, 3, 4, 5, 6, 7, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 7, 3, 4, 2, 2, 4, 5]
      bst = BinarySearchTree.new(array)

      expected = [[4, 1], [2, 2], [6, 2], [1, 3], [3, 3], [5, 3], [7, 3]]
      expect(bst.level_order).to eql(expected)
    end
  end

  describe "#find inexistent value" do
    it "returns nil when searching for a value that doesn't exist in the BST" do
      array = [1, 2, 3, 4, 5, 6, 7, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 7, 3, 4, 2, 2, 4, 5]
      bst = BinarySearchTree.new(array)

      expect(bst.find(20)).to eql(nil)
    end
  end

  describe "#find existent value" do
    it "returns an existent node when searching for a value that exists in the BST" do
      array = [1, 2, 3, 4, 5, 6, 7, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 7, 3, 4, 2, 2, 4, 5]
      bst = BinarySearchTree.new(array)

      expect(bst.find(5).value).to eql(5)
    end
  end

  describe "#insert in an empty BST" do
    it "inserts a value in the BST and makes it its root" do
      bst = BinarySearchTree.new
      bst.insert(1)

      expect(bst.root.value).to eql(1)
    end
  end

  describe "#insert in a non empty BST" do
    it "inserts a value in the BST" do
      bst = BinarySearchTree.new([1, 4, 6])
      bst.insert(3)

      expect(bst.root.left.right.value).to eql(3)
    end
  end
end