class DayOne
	attr_reader :list

	def initialize(list)
		@list = list
	end

	def numbers
		current_idx = 0
		to_test = 1

		while to_test < list.size do
			a = list[current_idx]
			b = list[to_test]

			if a + b == 2020
				return [a, b]
			else
				to_test += 1
			end
		end

		return nil
	end
end