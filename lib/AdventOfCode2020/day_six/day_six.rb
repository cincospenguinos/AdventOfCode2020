class DaySix
	attr_reader :groups

	def initialize(groups)
		@groups = groups.map { |g| Group.new(g) }
	end

	def count
		groups.map(&:unique).inject(:+)
	end

	class Group
		attr_reader :string

		def initialize(string)
			@string = string.gsub(/\s+/, '')
		end

		def unique
			string.split('').to_set.count
		end
	end
end