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
end