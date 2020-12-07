require_relative 'group'

class DaySix
	attr_reader :groups

	def initialize(groups)
		@groups = groups.map { |g| Group.new(g) }
	end

	def count
		groups.map(&:unique).inject(:+)
	end

	def strict_count
		groups.map(&:every).inject(:+)
	end
end