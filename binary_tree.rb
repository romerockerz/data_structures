class TreeNode
    attr_accessor :value, :left, :right
    def initialize(value = nil, left = nil, right = nil)
        @value = value
        @left = left
        @right = right
    end
end

class BinaryTreeMethods

    def self.create_node(value)
        TreeNode.new(value)
    end

    def self.insert_binary_tree_node(new_root, node = create_node(rand(0..500)))
        root = new_root
        if !root.nil? && root.value >= node.value
            insert_binary_tree_node(root.left, node) if root.left != nil
            root.left = node if root.left == nil
        elsif !root.nil? && root.value < node.value 
            insert_binary_tree_node(root.right, node) if root.right != nil 
            root.right = node if root.right == nil
        end
    end
end

root = TreeNode.new(rand(0..500))
500.times do 
   BinaryTreeMethods.insert_binary_tree_node(root)
end

p root.value
p root.left.value
p root.left.right.value