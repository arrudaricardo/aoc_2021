	class DAY3 

	def initialize()
		@file = File.open("input.txt") {|file|
		file.read().split(/\n/).map! { |x| x.split("") }
		}
	end
	def solution_1()
		gama_rate = String.new
		epsilon_rate = String.new
		for i in 0...@file.first().size() do
			c = [] 
			@file.each do |el|
				c.push	el[i]
			end
			num_0 = c.count('0')
			num_1 = @file.size() - num_0
			gama_rate += num_0 > num_1 ? "0" : "1"
			epsilon_rate += num_0 < num_1 ? "0" : "1"
		end
		g = gama_rate.to_i(2)
		e = epsilon_rate.to_i(2)
		solution = g * e
		solution
	end

	def oxygen_generator_rating()
		items = @file.dup
		row_index = 0
		while true do
			mode = check_bit_mode(items, row_index)
			# Remove mode for the row
			if items.size() == 1
				break
			end
			items = remove_bit_mode(items, row_index , mode )
			row_index += 1
		end
		items.first().join().to_i(2)
	end

	def scrubber_rating()
		items = @file.dup
		row_index = 0
		while true do
			mode = check_bit_mode(items, row_index)
			# Remove mode for the row
			if items.size() == 1
				break
			end
			items = remove_bit_mode_s(items, row_index , mode )
			row_index += 1
		end
		items.first().join().to_i(2)
	end

	def remove_bit_mode(array, i, mode)
		array.filter! do |row|
			value = row[i]
			if value == '0' and mode == '1'
					false 
			elsif value == '1' and mode == '0'
					false
			elsif value == '0' and mode == ''
					false
			else
				true
			end
		end
	end
	
	def remove_bit_mode_s(array, i, mode)
		array.filter! do |row|
			value = row[i]
			if value == '0' and mode == '0'
					false 
			elsif value == '1' and mode == '1'
					false
			elsif value == '1' and mode == ''
					false
			else
				true
			end
		end
	end

	def check_bit_mode(array, i)
		c = [] 
		array.each do |el|
			c.push el[i]
		end
		num_0 = c.count('0')
		num_1 = array.size() - num_0
		if num_0 > num_1 
			return '0'
		elsif num_0 < num_1 
			return '1'
		else
			return ''
		end
	end

	def solution_2()
		ox = oxygen_generator_rating() 
		sc = scrubber_rating()
		ox * sc
	end


end

day_3 = DAY3.new
puts day_3.solution_1
puts day_3.solution_2
