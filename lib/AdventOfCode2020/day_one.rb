class DayOne
	attr_reader :list, :amount_of_addends

	def initialize(list, amount_of_addends = 2)
		@list = list
		@numbers = nil
		@amount_of_addends = amount_of_addends
	end

	def numbers
		return @numbers unless @numbers.nil?

		NumberSearch.new(self).meta_search(0)
		current_values
	end

	def product
		@numbers ||= numbers
		@numbers.inject(:*)
	end

	def indexes
		@indexes ||= (0...amount_of_addends).to_a
	end

	def current_values
		indexes.map { |i| list[i] }
	end

	private

	class NumberSearch
		attr_reader :day

		def initialize(day)
			@day = day
		end

		def meta_search(index)
			while day.indexes[index] < day.list.size do
				if day.indexes[index + 1] == day.indexes[-1]
					did_find = search_within(index + 1) { day.current_values.inject(:+) == 2020 }
				else
					did_find = meta_search(index + 1)
				end

				if did_find
					@numbers = day.current_values
					return true
				end

				day.indexes[index] += 1
				day.indexes[index + 1] = day.indexes[index] + 1
			end

			false
		end

		def search_within(index)
			while day.indexes[index] < day.list.size do
				if yield
					return true
				else
					day.indexes[index] += 1
				end
			end

			false
		end
	end
end