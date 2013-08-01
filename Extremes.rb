def find_extreme(nums)
	min = ( (2 ** (32 - 2)) - 1 )
	max = -(min) - 1

	count = 0

	nums.each do |num|
		min = num if num < min
		max = num if num > max

		count += num
	end

	avg = (count / nums.length).ceil

	return (min-avg).abs > (max-avg).abs ? min : max

end



puts find_extreme([4,9,-3,-10])