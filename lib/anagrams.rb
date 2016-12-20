def anagrams(string_all, anagrams_dic)
	return_array = []
	

	string_chars = string_all.split("")
	string_chars_all_pos = Array.new(string_chars.size, string_chars)
	positions = Array.new(string_chars.size, 0)
	i = 0
	while i < factorial(string_chars.size)
		a_string_arr = []
		positions.size.times do |x|
			a_string_arr << string_chars_all_pos[x][positions[x]]
		end
		uniq_pos = positions.uniq
		if(uniq_pos.size == positions.size)
			i += 1
			if anagrams_dic.include?(a_string_arr.join.upcase)
				return_array << a_string_arr.join.upcase
			end
		end
		positions = calculate_next_pos(positions)
	end
	return_array
end

def factorial(n=0)
  (1..n).inject(:*)
end

def calculate_next_pos(cur_pos)
	array_size = cur_pos.size
	should_add = true
	(array_size - 1).downto(1) do |index|
		#p "While index is #{index} and cur pos of that is #{cur_pos[index]} and should add is #{should_add}"
		if(cur_pos[index] == array_size - 1 && should_add)
			cur_pos[index] = 0
			if cur_pos[index - 1] < array_size - 1
				should_add = false
				cur_pos[index - 1] += 1
			else
				should_add = true
			end
			#p "New Array is #{cur_pos}"
		elsif(index == array_size - 1)
			should_add = false
			cur_pos[index] += 1
		elsif should_add
			cur_pos[index] += 1
			should_add = false
		end
	end
	cur_pos
end

#anagrams("pears")
