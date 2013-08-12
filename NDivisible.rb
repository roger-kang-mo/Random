class NDivisible

	def initialize 

	end

	def get_n_divisible (n, m)

		highest = 0
		current = ('9'*n).to_i
		while highest == 0 and current > 0
			if current % m == 0
				highest = current
			else
				current -= 1
			end
		end

		highest = "No solution found." if highest == 0

		return highest
	end
end