class DigitalRoot

	# http://en.wikipedia.org/wiki/Digital_root

	def initialize

	end

	def get_root(start_num)
		nums = start_num.to_s.split('')
		current = 0

		nums.each { |num| current += num.to_i }

		if current >= 10
			current = get_root(current)	
		end
		
		current
	end
end