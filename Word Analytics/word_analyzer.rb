words_count = 0
letters_count = 0
symbols_count = 0
most_common_words = Array.new(3, '')
most_common_par_start = ''
words_used_once = []
letters_not_used = Hash.new

while line = $stdin.gets
	line = line.downcase

	words_count += line.split().length
	letters_count += line.scan(/[a-z]/).length
	symbols_count += line.gsub(/[a-z0-9 \n]/i, '').length


end


puts "number of words: #{words_count}"
puts "number of letters: #{letters_count}"
puts "number of symbols: #{symbols_count}"