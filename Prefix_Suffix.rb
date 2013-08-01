def solution(s)
    string_forward = s.dup
    longest_occurrence = ''
    for_string = ''
    back_string = ''
    op_counter = string_forward.length - 1
    
    string_forward.chars.to_a.each_index do |i|
        for_string << string_forward[i]
        back_string = string_forward[op_counter] + back_string

        break if i == string_forward.length/2
            
        if for_string == back_string and string_forward[i+1..op_counter-1].scan(for_string).length > 0
            longest_occurrence = for_string.dup if for_string.length > longest_occurrence.length
        end
        
           
        op_counter -= 1
    end

    longest_occurrence.length
end


puts solution('barbrarhubarb')
puts solution('baaab')
puts solution('ababab')