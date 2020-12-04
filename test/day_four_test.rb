require 'test_helper'

describe 'DayFour' do
	valid = <<~STR
		ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
		byr:1937 iyr:2017 cid:147 hgt:183cm
	STR

	invalid = <<~STR
		iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
		hcl:#cfa07d byr:1929
	STR

	invalid_better = <<~STR
		eyr:1972 cid:100
		hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

		iyr:2019
		hcl:#602927 eyr:1967 hgt:170cm
		ecl:grn pid:012533040 byr:1946

		hcl:dab227 iyr:2012
		ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

		hgt:59cm ecl:zzz
		eyr:2038 hcl:74454a iyr:2023
		pid:3556412378 byr:2007
	STR

	valid_better = <<~STR
		pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
		hcl:#623a2f

		eyr:2029 ecl:blu cid:129 byr:1989
		iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

		hcl:#888785
		hgt:164cm byr:2001 iyr:2015 cid:88
		pid:545766238 ecl:hzl
		eyr:2022

		iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719
	STR

	it 'accepts valid passports' do
		assert DayFour.new([valid]).valid_count == 1
	end

	it 'rejects invalid passports' do
		assert DayFour.new([invalid]).valid_count == 0
	end

	it 'solves part one' do
		passports = File.read('data/day4.txt').split("\n\n").map(&:chomp)
		assert DayFour.new(passports).valid_count == 192
	end

	it 'properly rejects with BetterValidator' do
		passports = invalid_better.split("\n\n").map(&:chomp)
		assert DayFour.new(passports, 'BetterValidator').valid_count == 0
	end

	it 'properly accepts with BetterValidator' do
		passports = valid_better.split("\n\n").map(&:chomp)
		assert DayFour.new(passports, 'BetterValidator').valid_count == 4
	end

	it 'solves part two' do
		passports = File.read('data/day4.txt').split("\n\n").map(&:chomp)
		assert DayFour.new(passports, 'BetterValidator').valid_count == 101
	end
end