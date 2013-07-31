room_data = Array.new(100) {Array.new(2, 0)}


line_1_of_file = gets

while line = $stdin.gets

	pID, room_num, in_out, timestamp = line.split().collect { |elem| elem.match(/[0-9]/) ? elem.to_i : elem }

	room_data[room_num][0] = Hash.new unless room_data[room_num][0].is_a? Hash

	room_data[room_num][0][pID.to_s.to_sym] = true unless room_data[room_num][0][pID.to_s.to_sym]


	room_data[room_num][1] += in_out == 'I' ? -timestamp : timestamp

end

room_data.each_with_index do |room, room_num|

	visitor_count = room[0] == 0 ? 0 : room[0].length 

	if visitor_count > 0
		puts "Room #{room_num}, #{room[1]/visitor_count} minute average visit, #{visitor_count} visitor(s) total"
	end
end
