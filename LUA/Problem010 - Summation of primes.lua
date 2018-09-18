--[[
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
]]

-- Variables: Our target limit, and the sum we'll be tracking. Start with 2 added for ease.
target = 2000000
sum = 2

-- We want all primes below 2000000, so count up to that number. Skip even numbers since they (other than 2) are never primes.
for i = 3, target -1, 2 do
	prime = true
	local j = 3
	-- We only need to check up to the square root of i. Since square roots take longer than their opposite, we simply square our iterator instead.
	while (j * j) <= i do
		-- If i is divisible by j, then it is not a prime number, so we skip to the next number to check.
		if i % j == 0 then
			prime = false
			break
		end
		j = j + 2
	end
	-- If we've found a prime, we add it to our sum
	if prime == true then
		sum = sum + i
	end
end

-- Print the final value. Note that to print the sum we have to use a float, since otherwise we overflow.
io.write(string.format("The sum of all primes below %d is %.0f", target, sum))
