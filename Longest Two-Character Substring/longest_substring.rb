def get_longest_substring(input)
	current = ''
	best_substring = ''

	input.chars.to_a.each_index do |index|
		input[index..-1].chars.to_a.each do |c|
			current << c

			if current.chars.to_a.uniq.length < 3 and current.length >= best_substring.length
				best_substring = current.dup
			end
		end

		current = ''
	end

	best_substring
end



sample_input_1 = 'abbccc'
sample_input_2 = 'abcabcabcabccc'
sample_input_3 = 'qwertyyrewq'

puts get_longest_substring(sample_input_1)
puts get_longest_substring(sample_input_2)
puts get_longest_substring(sample_input_3)