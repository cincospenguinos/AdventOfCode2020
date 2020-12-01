class DayOne
	attr_reader :list, :amount_of_addends

	def initialize(list, amount_of_addends = 2)
		@list = list
		@numbers = nil
		@amount_of_addends = amount_of_addends
	end

	def numbers
		return @numbers unless @numbers.nil?

		while indexes[0] < list.size do
			did_find = search_within(1) { current_values.inject(:+) == 2020 }

			if did_find
				@numbers = current_values
				return current_values
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

	def current_values
		indexes.map { |i| list[i] }
	end

	def search_within(index)
		while indexes[index] < list.size do
			if yield
				return true
			else
				indexes[index] += 1
			end
		end

		false
	end
end