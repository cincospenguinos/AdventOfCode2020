class DayOne
	attr_reader :list, :amount_of_addends

	def initialize(list, amount_of_addends = 2)
		@list = list
		@numbers = nil
		@amount_of_addends = amount_of_addends
	end

	def numbers
		return @numbers unless @numbers.nil?

		meta_search(0)
		current_values
	end

	def product
		@numbers ||= numbers
		@numbers.inject(:*)
	end

	private

	def indexes
		@indexes ||= (0...amount_of_addends).to_a
	end

	def current_values
		indexes.map { |i| list[i] }
	end

	def meta_search(index)
		while indexes[index] < list.size do
			if indexes[index + 1] == indexes[-1]
				did_find = search_within(index + 1) { current_values.inject(:+) == 2020 }
			else
				did_find = meta_search(index + 1)
			end

			if did_find
				@numbers = current_values
				return true
			end

			indexes[index] += 1
			indexes[index + 1] = indexes[index] + 1
		end

		false
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