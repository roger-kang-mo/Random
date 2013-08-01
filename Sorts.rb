def quicksort(nums)
	return nums if nums.length <= 1

	pivot = nums[(nums.length / 2).round]

	lesser = []
	greater = []

	nums.each_index do |i|
		if nums[i] < pivot
			lesser << nums[i]
		elsif nums[i] > pivot
			greater << nums[i]
		end
	end

	return (quicksort(lesser) << pivot << quicksort(greater)).flatten
end

def mergesort(nums)
	return nums if nums.length <= 1

	middle = (nums.length/2).round

	left_nums = nums.take(middle)
	right_nums = nums.drop(middle)

	left = mergesort(left_nums)
	right = mergesort(right_nums) 

	right.concat(left)
end

def merge(left, right)
	left_counter = 0
	right_counter = 0
	merged = []

	while left.length > 0 or right.length > 0

	end

	return merged
end


inputs = [4,9,2,1,5,7,3].shuffle

puts "Initial Array: #{inputs}\n\n"
puts "Quicksort result: \n#{quicksort(inputs)}\n\n"
puts "Mergesort result: \n#{mergesort(inputs)}\n\n"