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
end