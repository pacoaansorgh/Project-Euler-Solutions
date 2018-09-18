--[[
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
]]

-- height and width of our grid
gridheight = 20
gridwidth = 20

-- We'll store previously calculated paths in this table
grid = {}

-- Initialize the table
for i = 1, gridheight do
	grid[i] = {}
	for j = 1, gridwidth do
		grid[i][j] = 0
	end
end

-- Recursive function that will give us the number of paths through a grid
function Lattice(height, width)
	-- If width or height has reached 0, there is only 1 way to the end. Return 1.
	if width == 0 or height == 0 then
		return 1
	-- If we have a stored value for this width/height combination, return the stored value
	elseif grid[height][width] ~= 0 then
		return grid[height][width]
	end
	-- Otherwise, recursively call the Lattice function twice, with reduced height and reduced width respectively.
	result = Lattice(height-1, width) + Lattice(height, width-1)
	-- Then store the result of those function calls so we can skip future calculations
	grid[height][width] = result
	return result
end

-- Get our answer from the Lattice function, and write the answer
answer = Lattice(gridheight, gridwidth)
io.write(string.format("The number of paths through a %d by %d grid is %.0f", gridheight, gridwidth, answer))