class DayThree
	attr_reader :map, :current_pos

	def initialize(map)
		@map = map.split("\n").map(&:chomp)
		@current_pos = { x: 0, y: 0 }
	end

	def trees
		trees = 0

		while current_pos[:y] < map.length
			row = map[current_pos[:y]]
			trees += 1 if row[current_pos[:x]] == '#'
			current_pos[:x] += 3
			current_pos[:x] %= row.length
			current_pos[:y] += 1
		end

		trees
	end
end