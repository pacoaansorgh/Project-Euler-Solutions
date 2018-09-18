--[[
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
]]

-- Largest palindrome we have found so far
largest = 1

-- Start out first number at 100, the smallest 3-digit number
for i = 100, 999 do
	-- Start our second number at wherever our first is at, everything below that is duplicate
	for j = i, 999 do
		product = i * j
		-- First check if the product is the largest so far, which is faster to check than if it is a palindrome
		if product > largest then
			-- If it is the largest, reverse the number so we can check if it is a palindrome. If it is, remember it as the largest so far.
			palindrome = tonumber(string.reverse(tostring(product)))
			if palindrome == product then
				largest = product
			end
		end
	end
end

io.write("The largest palindrome product of two 3-digit numbers is ", largest)

--[[

Below is an alternative method of reversing the number, without casting to string and back.

temp = product
palindrome = 0
while temp > 0 do
palindrome = palindrome * 10
palindrome = palindrome + (temp % 10)
temp = math.floor(temp / 10)
end
if palindrome == product then
	largest = product
end
]]