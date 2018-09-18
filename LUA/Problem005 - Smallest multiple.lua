--[[
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
]]

-- We start our search at 2640, the first number greater than 2520 that is divisible by 11 and 20.
-- Since we know the next 19 numbers divisible by 11 are not divisible by 20, we can increment in steps of 220 (20*11)
limit = 20
searching = true
number = 2640

while searching do
	-- Loop back through our numbers, since fewer numbers are divisible by larger numbers (1/19 vs 1/11)
	-- Don't check 1-10 since we can assume those will work, since we check their doubles before we get to them (e.g. 20 is the double of 10, so if 20 works 10 will too).
	-- Don't check 11 or 20 since we increment in steps of 11*20, so those will always work
	local divisible = true
	for i = limit-1, 12, -1 do
		-- If the number is not divisible by this divisor, stop checking and move on to the next number.
		if  number % i ~= 0 then
			divisible = false
			break
		end
	end
	-- If divisible is true here, we've found our target number, so we stop the while loop
	if divisible == true then
		break
	end
	-- If this number was not our target number, increment it by 11*20
	number = number + 220
end

-- Print the final result
io.write(string.format("The smallest positive number evenly divisible by all numbers from 1-%.0f is %.0f", limit, number))