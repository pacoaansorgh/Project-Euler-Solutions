--[[
The following iterative sequence is defined for the set of positive integers:

n ? n/2 (n is even)
n ? 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 ? 40 ? 20 ? 10 ? 5 ? 16 ? 8 ? 4 ? 2 ? 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
]]

-- Variables: Previous chain lengths; upper limit for our search; largest chain found so far; number that produced the longest chain so far
collatz = {1, 2}
limit = 1000000
largestChain = 0
largestNumber = 0

-- Look at every number below our limit (except 1 and 2 since we know those have chains of length 1 and 2 respectively)
for i = 3, limit - 1 do
	local chain = 0
	local number = i
	-- Until we hit 1 with our number (or if we later find a number we've seen before) we keep going
	while number ~= 1 do
		-- Collatz sequence: divide by 2 if even, multiply by 3 and add 1 if odd.
		if number % 2 == 0 then
			number = number / 2
		else
			number = (number * 3) + 1
		end
		chain = chain + 1
		-- If we've seen this number before, we should know what the sequence length is for it, so add that length and take an early out
		if number < i then
			chain = chain + collatz[number]
			break
		end
	end
	-- If this chain is the largest so far, remember it and the number that caused it
	if chain > largestChain then
		largestChain = chain
		largestNumber = i
	end
	-- Insert the chain for this number into our table for future use
	table.insert(collatz, chain)
end

-- Write our final answer
io.write(string.format("The number below %d that produced the largest collatz sequence was %d, with a sequence of length %d", limit, largestNumber, largestChain))
