--[[
You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
]]

monthsizes = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}

-- Variables: total hits; current year; day of the week; day of the month; month of the year
total = 0
year = 1900
weekday = 1
monthday = 1
month = 1

while year < 2001 do
	-- If we've found a sunday on the first of the month, add one to our counter
	if year > 1900 and weekday == 7 and monthday == 1 then
		total = total + 1
	end
	-- Move on to the next day
	weekday = weekday%7 + 1
	monthday = monthday + 1
	-- If we've hit the end of the month:
	if monthday > monthsizes[month] then
		-- Check if it was the last month of the year, add one to year and reset month to one
		if month == 12 then
			year = year + 1
			month = 1
			-- Check if the new year is a leap year. If so, set the days in febuary to 29, otherwise set them to 28
			if year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0) then
				monthsizes[2] = 29
			else
				monthsizes[2] = 28
			end
		-- If it is not a new year, simply increment month by 1
		else
			month = month + 1
		end
		-- And reset the day of the month to 1
		monthday = 1
	end
end

-- Now write out our final tally
io.write("The number of sundays on the first of the month during the twentieth century was: ", total)