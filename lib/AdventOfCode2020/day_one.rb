class DayOne
	attr_reader :list

	def initialize(list, amount_of_addends = 2)
		@list = list
		@numbers = nil
		@amount_of_addends = amount_of_addends
	end

	def numbers
		return @numbers unless @numbers.nil?

		while indexes[0] < list.size do
			while indexes[1] < list.size do
				nums_to_test = indexes.map { |i| list[i] }
				sum = nums_to_test.inject(:+)

				if sum == 2020
					@numbers = nums_to_test
					return @numbers
				end

				indexes[1] += 1
			end

			indexes[0] += 1
			indexes[1] = indexes[0] + 1
		end

		return nil
	end

	def product
		@numbers ||= numbers
		@numbers[0] * @numbers[1]
	end

	private

	def indexes
		@indexes ||= [0, 1]
	end
end