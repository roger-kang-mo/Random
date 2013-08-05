
def sort_edges(input)
	final_order = Array.new(input.length, '')

	input.each do |k, v|
		if v[0] < v[1]
			final_order[v[0]-1] = k.to_s
		else
			final_order[v[1]-1] = k.to_s
		end
	end

	final_order
end

sample_in_1 = {
	A: [3, 4],
	B: [4, 5],
	C: [1, 2],
	D: [2, 3]
}

sample_in_2 = {
	F: [2, 3],
	B: [1, 2],
	D: [6, 5],
	C: [6, 7],
	E: [5, 4],
	A: [3, 4]
}


puts "Trying sample 1: \n#{sort_edges(sample_in_1)}\n\n"

puts "Trying sample 2: \n#{sort_edges(sample_in_2)}\n\n"