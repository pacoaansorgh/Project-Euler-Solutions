--[[
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
]]

-- For this solution I am not using a bignum library. I will attempt to achieve the correct result through use of tables

-- A limit we use to set the number of digits each individual part of our number can have. The bigger it is, the fewer multiplications we need to do.
limit = 10000000000000
-- Our target number of powers to get to
target = 1000

-- Create our table of numbers
numbers = {}

-- Initialize the first value to 1
numbers[1] = 1

for i = 1, target do
	-- Double our numbers from large to small
	for j = #numbers, 1, -1 do
		numbers[j] = numbers[j] * 2
		-- If a number gets too large for its container, we move the newly created largest digit to the next container
		if numbers[j] > limit then
			-- nil check. If it is not, simply add one to the next container. If it is, then we create a new entry with value 1 in our table
			if numbers[j+1] ~= nil then
				numbers[j+1] = numbers[j+1] + 1
			else
				numbers[j+1] = 1
			end
			-- And dont forget to remove the new digit from our old number
			numbers[j] = numbers[j] - limit
		end
	end
end

-- Now lets sum up our numbers. Since we store them multiple digits at a time we need to extract the individual digits from the numbers now
sum = 0
for i = #numbers, 1, -1 do
	while numbers[i] ~= 0 do
		sum = sum + (numbers[i]%10)
		numbers[i] = math.floor(numbers[i] / 10)
	end
end

-- Write the final answer
io.write(string.format("The sum of the digits of the number 2^%d is %d", target, sum))