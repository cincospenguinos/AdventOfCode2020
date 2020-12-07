require_relative 'group'

class DaySix
	attr_reader :groups

	def initialize(groups)
		@groups = groups.map { |g| Group.new(g) }
	end

	def count
		count_with(:unique)
	end

	def strict_count
		count_with(:every)
	end

	private

	def count_with(func)
		groups.map(&func).inject(:+)
	end
end