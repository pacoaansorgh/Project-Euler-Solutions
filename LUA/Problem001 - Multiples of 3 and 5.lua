--[[
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
]]

-- The numbers we are looking for multiples of
multiples = {3, 5}
-- The limit of our search, exclusive
limit = 1000
-- The sum of our found multiples
sum = 0

-- For every number up to our limit (exlusive)
for i = 1, limit - 1, 1 do
	-- For every number we are looking for multiples of
	for j = 1, #multiples, 1 do
		-- If it is divisible by that number it is a multiple of that number
		if i % multiples[j] == 0 then
			-- So we add it to the sum and skip to the next number
			sum = sum + i
			break
		end
	end
end

--[[
Now we want to print the variables we were working with and the final value we arrived at. 
Note that we could create a single string and print only once, but that would require either successive concatenations which I would prefer to avoid,
or require us to build an array of strings to concatenate all at once, which is more effort than it's worth in this case.
]]
io.write("The sum of all multiples of ")
-- We want to show which numbers we were looking for multiples of, so go through them now
for i = 1, #multiples do
	-- If this is the last multiple, and not the first (which happens if we have only 1) print it with an "and"
	if i == #multiples and i ~= 1 then
		io.write(string.format(" and %.0f", multiples[i]))
	-- If it is neither the last nor the first, then print it with a comma and an empty space
	elseif i ~= 1 then
		io.write(string.format(", %.0f",multiples[i]))
	-- If it is the first, just print it
	else
		io.write(multiples[i])
	end
end
-- Now add the limit and the sum to the string, and print it
io.write(string.format(" below %.0f is %.0f", limit, sum))