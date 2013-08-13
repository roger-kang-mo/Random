class MinimumAngle

	attr_reader :min_angle, :hour, :min

	def initialize(h = 0, m = 0)
		@hour = h
		@hour = @hour - 12 if @hour > 12

		@min = m
		determine_min_angle()
	end

	def set_time (h, m)
		@hour = @hour - 12 if @hour > 12
		@hour = h
		@min = m
		determine_min_angle()
	end

	def set_hour(h)
		@hour = h
		@hour = @hour - 12 if @hour > 12
		determine_min_angle()
	end

	def set_min(m)
		@min = m
		determine_min_angle()
	end

	def determine_min_angle
		@min_angle = 0

		hour_angle = @hour * 30 + @min/2
		minute_angle = @min * 6

		@min_angle = (hour_angle - minute_angle).abs

		@min_angle = @min_angle <= 180 ? @min_angle : 360 - @min_angle

		@min_angle
	end
	
end