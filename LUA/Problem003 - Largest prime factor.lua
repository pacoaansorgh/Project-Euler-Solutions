--[[
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
]]

-- Our target number
target = 600851475143
-- The largest divisor we've found so far
largest = 1
-- The current divisor we are checking
divisor = 2
-- Since we are going to divide our target number, remember it now in the final string we want to print
finalstring = string.format("The largest prime factor of %.0f is ", target)

-- While our divisor is smaller than or equal to our target, keep looking for the largest divisor. We also look at equals, since the final divisor will be the number itself.
while divisor <= target do
	-- If our target is divisible by our divisor
	if target % divisor == 0 then
		-- If our divisor is the largest we've found so far
		if divisor > largest then
			-- Remember this divisor as the largest so far
			largest = divisor
		end
		-- Divide our target by that divisor, and reset the divisor counter
		target = target / divisor
		divisor = 1
	end
	-- Increment our divisor counter
	divisor = divisor + 1
end

-- Now add the final value to the string, and print it
finalstring = finalstring..largest
io.write(finalstring)