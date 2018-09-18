--[[
The sum of the squares of the first ten natural numbers is,

1^2 + 2^2 + ... + 10^2 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)2 = 55^2 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
]]

-- Some variables: our starting value, our limit, and two counters we'll keep
limit = 100
start = 1
squareofsums = 0
sumofsquares = 0

for i = start, limit do
	-- Add the number to the squareofsums so we can square it when we're done.
	squareofsums = squareofsums + i
	-- Add the square to the sumofsquares.
	sumofsquares = sumofsquares + (i*i)
end

-- Square the squareofsums, since so far it's just all the numbers from start-limit added together.
squareofsums = squareofsums * squareofsums

-- Get the difference - squareofsums will be bigger so we subtract the sumofsquares from it.
difference = squareofsums - sumofsquares

-- Print the final answer
io.write(string.format("The difference between the sum of the squares of the first %.0f natural numbers and the square of the sum is %.0f", limit, difference))