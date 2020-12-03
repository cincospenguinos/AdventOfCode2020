require 'test_helper'

describe 'DayThree' do
	example_map = <<~STR
		..##.......
		#...#...#..
		.#....#..#.
		..#.#...#.#
		.#...##..#.
		..#.##.....
		.#.#.#....#
		.#........#
		#.##...#...
		#...##....#
		.#..#...#.#
	STR

	it 'properly counts trees' do
		assert DayThree.new(example_map).trees == 7
	end

	it 'solves part one' do
		map = File.read('data/day3.txt')
		assert DayThree.new(map).trees == 276
	end

	it 'accepts a second movement arg' do
		assert DayThree.new(example_map, { right: 1, down: 1 }).trees == 2
	end

	it 'solves part two' do
		map = File.read('data/day3.txt')
		assert [
			{ right: 1, down: 1 },
			{ right: 3, down: 1 },
			{ right: 5, down: 1 },
			{ right: 7, down: 1 },
			{ right: 1, down: 2 }
		].map { |movement| DayThree.new(map, movement).trees }
			.inject(:*) == 7812180000
	end
end