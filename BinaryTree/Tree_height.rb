require './binarytree'

include BinaryTree

def get_height(tree, height = 0)

	return 0 if tree.nil?
	return height if tree.right.nil? and tree.left.nil?

	left_height = get_height(tree.left, height+1)
	right_height = get_height(tree.right, height+1)

	left_height > right_height ? left_height : right_height
end

def traverse(tree, order = :pre)
	return_val = ''

	return tree.word if tree.left.nil? and tree.right.nil?

	case order

	when :pre
		return_val = tree.word + ', '
		return_val << traverse(tree.left, order) + ', ' unless tree.left.nil?
		return_val << traverse(tree.right, order) unless tree.right.nil?
	when :post
		return_val << traverse(tree.left, order) + ', ' unless tree.left.nil?
		return_val << traverse(tree.right, order) + ', ' unless tree.right.nil?
		return_val << tree.word
	when :in
		return_val << traverse(tree.left, order) + ', ' unless tree.left.nil?
		return_val << tree.word + ', '
		return_val << traverse(tree.right, order) unless tree.right.nil?
	end

	return_val
end

def gimme_space_to_breathe
	puts "\n---------------------------------------------\n"
end



# Sample tree
items = [50, 20, 80, 10, 30, 70, 90, 5, 14,
         28, 41, 66, 75, 88, 96]

strings = ['apple', 'banana', 'coffee', 'durian', 'frankenberry', 'grapefruit', 
	'huckleberry', 'ingleberry', 'jackfruit', 'kiwi']


nums_tree = Node.new(60)

items.each { |item| nums_tree.insert(Node.new(item)) }
	

string_tree = Node.new('elderberry')
strings.each { |s| string_tree.insert(Node.new(s)) }

puts 'Getting Tree Height...'
puts get_height(nums_tree)

gimme_space_to_breathe
puts "Getting Pre order traversal..."
puts traverse(string_tree, :pre)

gimme_space_to_breathe
puts "Getting Post order traversal..."
puts traverse(string_tree, :post)

gimme_space_to_breathe
puts "Getting in order traversal..."
puts traverse(string_tree, :in)




