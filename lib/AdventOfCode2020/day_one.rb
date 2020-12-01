class DayOne
	attr_reader :list

	def initialize(list)
		@list = list
		@numbers = nil
	end

	def numbers
		return @numbers unless @numbers.nil?

		current_idx = 0
		to_test = 1

		while current_idx < list.size do
			while to_test < list.size do
				a = list[current_idx]
				b = list[to_test]

				if a + b == 2020
					@numbers = [a, b]
					return @numbers
				end

				to_test += 1
			end

			current_idx += 1
			to_test = current_idx + 1
		end

		return nil
	end

	def product
		@numbers ||= numbers
		@numbers[0] * @numbers[1]
	end
end