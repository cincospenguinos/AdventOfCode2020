require_relative 'day_four/hack_validator'
require_relative 'day_four/better_validator'

class DayFour
	attr_reader :passports, :validator

	def initialize(passports, validator = 'HackValidator')
		@passports = passports.map { |p| Passport.new(p) }
		@validator = Object.const_get(validator).new
	end

	def valid_count
		passports
			.select { |passport| validator.valid?(passport) }
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