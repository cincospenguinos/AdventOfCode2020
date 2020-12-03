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
end