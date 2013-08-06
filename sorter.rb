class Sorter

	attr_reader :values

	def initialize
		@values = shuffle_values
	end

	public 
	def sorted?
		is_it_sorted = true
		10.times { |i| is_it_sorted = false if @values[i] != i+1 }

		is_it_sorted
	end

	def sort_by(opts = {})

		case opts[:method]
		when :merge
			@values = mergesort(@values) 
		when :quick
			@values = quicksort(@values)
		when :bubble
			@values = bubblesort(@values)
		else
			@values = quicksort(@values)
		end
	end

	def shuffle_values
		@values = [1,2,3,4,5,6,7,8,9,10].shuffle
	end

	private

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

	def bubblesort(nums)
		is_sorted = false
		sorted_nums = nums.dup

		while !is_sorted 
			is_sorted = true
			sorted_nums.each_with_index do |num, index|
				unless index + 1 == sorted_nums.length
					if sorted_nums[index] > sorted_nums[index+1]
						swapHolder = sorted_nums[index]
						sorted_nums[index] = sorted_nums[index+1]
						sorted_nums[index+1] = swapHolder
						is_sorted = false
					end
				end
			end			
		end

		return sorted_nums
	end

	def mergesort(nums)
		return nums if nums.length <= 1

		middle = (nums.length/2).round

		left_nums = nums.take(middle)
		right_nums = nums.drop(middle)

		left = mergesort(left_nums)
		right = mergesort(right_nums) 

		merge(left, right)
	end

	def merge(left, right)
		left_counter = 0
		right_counter = 0
		merged = []

		while left_counter < left.length or right_counter < right.length
			if right.length == 0 or right_counter == right.length
				merged << left.drop(left_counter)
				merged.flatten!
				break
			elsif left.length == 0 or left_counter == left.length
				merged << right.drop(right_counter)
				merged.flatten!
				break
			else
				if left[left_counter] < right[right_counter]
					merged << left[left_counter]
					left_counter += 1
				elsif left[left_counter] > right[right_counter]
					merged << right[right_counter]
					right_counter += 1
				else
					merged << left[left_counter]
					merged << right[right_counter]
					left += 1
					right += 1
				end
			end
		end

		return merged
	end
end


# inputs = [4,9,2,1,5,7,3].shuffle

# puts "Initial Array: #{inputs}\n\n"
# puts "Quicksort result: \n#{quicksort(inputs)}\n\n"
# puts "Mergesort result: \n#{mergesort(inputs)}\n\n"
