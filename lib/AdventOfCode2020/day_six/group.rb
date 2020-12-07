class Group
	attr_reader :string, :individuals

	def initialize(string)
		@string = string.gsub(/\s+/, '')
		@individuals = string.split(/\s+/)
	end

	def unique
		string.split('').to_set.count
	end

	def every
		letters = individuals[0].split('')

		individuals[1...(individuals.size)].each do |individual|
			letters = individual
				.split('')
				.select { |i| letters.include?(i) }
		end

		letters.count
	end
end