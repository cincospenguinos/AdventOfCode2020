require 'test_helper'

describe 'DayOne' do
	it 'finds two numbers that sum to 2020' do
		numbers = [1721, 979, 366, 299, 675, 1456]
		day = DayOne.new(numbers)
		assert day.numbers == [1721, 299]
	end

	it 'finds numbers out of order' do
		numbers = [979, 299, 366, 675, 1456, 1721]
		day = DayOne.new(numbers)
		assert day.numbers == [299, 1721]
	end

	it 'gives the product of the numbers it finds' do
		numbers = [979, 299, 366, 675, 1456, 1721]
		day = DayOne.new(numbers)
		assert day.product == 514579
	end

	it 'part one' do
		numbers = File.read('data/day1.txt').split(/\s+/).map(&:to_i)
		assert DayOne.new(numbers).product == 870331
	end
end