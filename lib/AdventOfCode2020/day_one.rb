class DayOne
	attr_reader :list

	def initialize(list)
		@list = list
	end

	def numbers
		current_idx = 0
		to_test = 1

		while current_idx < list.size do
			while to_test < list.size do
				a = list[current_idx]
				b = list[to_test]

				return [a, b] if a + b == 2020
				to_test += 1
			end

			current_idx += 1
			to_test = current_idx + 1
		end

		return nil
	end
end