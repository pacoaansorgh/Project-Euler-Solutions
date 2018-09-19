--[[
n! means n × (n - 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
]]

-- For this solution I am not using a bignum library. I will attempt to achieve the correct result through use of tables

-- A limit we use to set the number of digits each individual part of our number can have. The bigger it is, the fewer multiplications we need to do.
limit = 1000000000000
-- Our target number of factors to get to
target = 100

-- Create our table of numbers
numbers = {}

-- Initialize the first value to 1
numbers[1] = 1

for i = 2, target do
	-- Multiply our numbers from large to small
	for j = #numbers, 1, -1 do
		numbers[j] = numbers[j] * i
		-- If a number gets too large for its container, we move the newly created largest digit(s) to the next container
		if numbers[j] > limit then
			-- nil check. If it is not, simply add the overflow to the next container. If it is, then we create a new entry with the overflow
			if numbers[j+1] ~= nil then
				numbers[j+1] = numbers[j+1] + (math.floor(numbers[j] / limit))
			else
				numbers[j+1] = math.floor(numbers[j] / limit)
			end
			-- And dont forget to remove the new digit from our old number
			numbers[j] = numbers[j] % limit
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
io.write(string.format("The sum of the digits of the number %d! is %d", target, sum))