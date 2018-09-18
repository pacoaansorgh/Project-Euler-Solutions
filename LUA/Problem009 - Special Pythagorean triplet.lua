--[[
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
]]

-- a < b < c means a cannot be bigger than 332
for a = 1, 332 do
	-- a < b < c means b starts at a+1, and cannot be bigger than 499
	for b = a+1, 499 do
		-- a+b+c == 1000 means c == 1000 - (a+b)
		c = 1000 - (a+b)
		-- if a^2 + b^2 == c^2 we've found our target
		if (a*a)+(b*b) == (c*c) then
			io.write(string.format("The pythagorean triplet are: a = %d, b = %d and c = %d, and the product is %d", a, b, c, a*b*c))
		end
	end
end
