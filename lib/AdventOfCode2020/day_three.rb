class DayThree
	attr_reader :map, :current_pos, :movement

	def initialize(map, movement = { right: 3, down: 1 })
		@map = map.split("\n").map(&:chomp)
		@movement = movement
		@current_pos = { x: 0, y: 0 }
	end

	def trees
		trees = 0

		while current_pos[:y] < map.length
			row = map[current_pos[:y]]
			trees += 1 if row[current_pos[:x]] == '#'
			current_pos[:x] += movement[:right]
			current_pos[:x] %= row.length
			current_pos[:y] += movement[:down]
		end

		trees
	end
end