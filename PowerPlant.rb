def get_days(n)
	num_days = 0

	n.times do |i|
		num_days += 1 unless (i+1)%3 == 0 or (i+1)%100 == 0 or (i+1)%14 == 0
	end

	num_days
end


puts "Simulating 1000 days at the power plant.\nUptime: #{get_days(1000)}"
puts "Simulating 100 days at the power plant.\nUptime: #{get_days(100)}"
puts "Simulating 10 days at the power plant.\nUptime: #{get_days(10)}"