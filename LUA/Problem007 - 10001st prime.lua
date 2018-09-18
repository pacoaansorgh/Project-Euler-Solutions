--[[
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
]]

-- Variables: The number of primes we've found so far; The value we are evaluating right now; The target number of primes we want.
primes = 0
value = 1
target = 10001

while primes < target do
	value = value + 1
	local prime = true
	-- Look for every divisor up to half the number. Nothing bigger than half the number can work.
	for i = 2, math.floor(value / 2) do
		-- If the value is divisible by any number, it is not a prime so we can skip to the next value.
		if value % i == 0 then
			prime = false
			break
		end
	end
	if prime == true then
		primes = primes + 1
	end
end

-- Write the final result
io.write(string.format("Prime number %d is %d", target, value))