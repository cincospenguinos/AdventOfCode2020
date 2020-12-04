require_relative 'hack_validator'

class BetterValidator < HackValidator
	def valid?(passport)
		return false unless super
		return false unless has_fields(passport)

		byr(passport) && iyr(passport) && eyr(passport) &&
		hgt(passport) && hcl(passport) && ecl(passport) &&
		pid(passport)
	end

	private

	def has_fields(passport)
		HackValidator::EXPECTED_FIELDS
			.reject { |field| passport.fields[field].nil? }
			.count == HackValidator::EXPECTED_FIELDS.count
	end

	def byr(passport)
		year = passport.fields[:byr].to_i
		year >= 1920 && year <= 2002
	end

	def iyr(passport)
		year = passport.fields[:iyr].to_i
		year >= 2010 && year <= 2020
	end

	def eyr(passport)
		year = passport.fields[:eyr].to_i
		year >= 2020 && year <= 2030
	end

	def hgt(passport)
		height = passport.fields[:hgt]

		if height.include?('cm')
			height = height.gsub('cm', '').to_i
			height >= 150 && height <= 193
		elsif height.include?('in')
			height = height.gsub('in', '').to_i
			height >= 59 && height <= 76
		else
			false
		end
	end

	def hcl(passport)
		color = passport.fields[:hcl]
		/\A#[a-f0-9]{6}\z/ =~ color
	end

	def ecl(passport)
		color = passport.fields[:ecl]
		%w(amb blu brn gry grn hzl oth).include?(color)
	end

	def pid(passport)
		/\A[0-9]{9}\z/ =~ passport.fields[:pid]
	end
end