class HackValidator
	EXPECTED_FIELDS = %i(byr iyr eyr hgt hcl ecl pid)

	def valid?(passport)
		EXPECTED_FIELDS.all? { |k| passport.keys.include?(k) }
	end
end