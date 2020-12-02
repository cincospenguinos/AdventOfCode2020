require_relative './number_search'

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
end