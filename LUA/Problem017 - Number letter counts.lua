--[[
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. 
For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. 
The use of "and" when writing out numbers is in compliance with British usage.
]]

-- Variables containing the number of letters in each word we might encounter
zerototwenty = {3, 3, 5, 4, 4, 3, 5, 5, 4, 3, 6, 6, 8, 8, 7, 7, 9, 8, 8, 6};
tenners = {3, 6, 6, 5, 5, 5, 7, 6, 6};
combiner = 3;
hundred = 7;
thousand = 8;

-- The limit of our search; the number of letters we've counted
limit = 1000
count = 0

for i = 1, limit do
	-- See if this number has a thousand in it
	if (i >= 1000) then
		count = count + zerototwenty[(math.floor(i/1000))] + thousand
		i = i % 1000
	end
	-- See if this number has a hundred in it
	if (i >= 100) then
		count = count + zerototwenty[(math.floor(i/100))] + hundred
		if i % 100 > 0 then
			count = count + combiner
		end	
		i = i % 100
	end
	-- If our remainder is greater than or equal to 20
	if (i > 20) then
		count = count + tenners[math.floor(i/10)]
		if i % 10 > 0 then
			count = count + zerototwenty[i%10]
		end
	-- If our remainder is 1-19
	elseif (i > 0) then
		count = count + zerototwenty[i]
	end
end

-- Print our final letter count
io.write(string.format("The number of letters in the numbers 1-%d is %d", limit, count))