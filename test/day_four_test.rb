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
end