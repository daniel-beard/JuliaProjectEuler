#=
You are given the following information, but you may prefer to do some research for yourself.

- 1 Jan 1900 was a Monday.
- Thirty days has September,
  April, June and November.
  All the rest have thirty-one,
  Saving February alone,
  Which has twenty-eight, rain or shine.
  And on leap years, twenty-nine.
- A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
=#

months = Dict(
  1 => 31,
  2 => 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31
)

function isleapyear(year)
  if year%100==0
    return year%400==0 ? true : false
  elseif year%4==0
    return true
  end
  false
end

function calc()
  currentyear = 1900
  currentmonth = 1
  totaldays = 1
  totalsundays = 0
  for year in 1901:2000
    months[2] = isleapyear(year) ? 29 : 28 # set feb
    for month in 1:length(months)
      totaldays += months[month]
      if (totaldays+1) % 7 == 0
        totalsundays += 1
      end
    end
  end
  totalsundays
end
@time println(calc())
