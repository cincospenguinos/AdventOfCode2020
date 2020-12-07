class Group
	attr_reader :string

	def initialize(string)
		@string = string.gsub(/\s+/, '')
	end

	def unique
		string.split('').to_set.count
	end
end