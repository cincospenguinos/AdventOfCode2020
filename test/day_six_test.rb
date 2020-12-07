require 'test_helper'

describe 'DaySix' do
	it 'handles a group of one' do
		groups = ['abc']
		assert DaySix.new(groups).count == 3
	end

	it 'handles a group of two' do
		groups = ['a ab']
		assert DaySix.new(groups).count == 2
	end

	it 'handles a group of three' do
		groups = ['a ab cdg']
		assert DaySix.new(groups).count == 5
	end

	it 'solves part one' do
		groups = File.read('data/day6.txt').split("\n\n")
		assert DaySix.new(groups).count == 6297
	end

	it 'handles the every case' do
		groups = ['a ab cdg']
		assert DaySix.new(groups).strict_count == 0
	end

	it 'handles the overlapping every case' do
		groups = ['a ab ac']
		assert DaySix.new(groups).strict_count == 1
	end

	it 'solves part two' do
		groups = File.read('data/day6.txt').split("\n\n")
		puts DaySix.new(groups).strict_count
	end
end