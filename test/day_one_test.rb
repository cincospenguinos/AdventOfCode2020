require 'test_helper'

describe 'DayOne' do
	it 'finds two numbers that sum to 2020' do
		numbers = [1721, 979, 366, 299, 675, 1456]
		day = DayOne.new(numbers)
		assert day.numbers == [1721, 299]
	end
end