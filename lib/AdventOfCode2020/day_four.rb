class DayFour
	attr_reader :passports

	def initialize(passports)
		@passports = passports.map { |p| Passport.new(p) }
	end

	def valid_count
		expected_fields = %i(byr iyr eyr hgt hcl ecl pid)
		passports.select do |passport|
			expected_fields.all? { |k| passport.keys.include?(k) }
		end
		.count
	end

	class Passport
		attr_reader :fields

		def initialize(info)
			@fields = {}

			info.split(/\s+/).map(&:chomp).map do |chunk|
				pieces = chunk.split(':')
				@fields[pieces[0].to_sym] = pieces[1]
			end
		end

		def keys
			fields.keys
		end
	end
end