-- 2a. Exponents
function pow(a,b)
         local x = 1
         local result = 1
         repeat
                result = result*a
                x = x+1
         until x > b
         return result
end

-- 2b. Array Summation
function sigma(array)
         local sum = 0
         local index = 1
         repeat
                sum = sum+array[index]
                index = index+1
         until index > table.getn(array)
         return sum
end

-- 3a. Longest String
function longestString(str1,str2,str3,str4)
         local len1 = #str1
         local len2 = #str2
         local len3 = #str3
         local len4 = #str4
         len = (len1 > len2) and len1 or len2
         len = (len > len3) and len or len3
         len = (len > len4) and len or len4
         if len == len1 then
             return str1
         elseif len == len2 then
            return str2
         elseif len == len3 then
            return str3
         end
         return str4
end

-- 3b. Quadratic Formula
function quadratic(a,b,c)
         local x1 = ((b*-1) + math.sqrt((b*b) - (4*a*c))) / (2*a)
         local x2 = ((b*-1) - math.sqrt((b*b) - (4*a*c))) / (2*a)
         return x1,x2
end

-- 4a. Reading in the file
turing = io.open("turing.tsv")

--This table has the keys set as the area of research
keysOfArea = {}

--This table has the keys set as the institution name
keysOfPlace = {}

--The 2 tables above make it easier for me to print out sorted tables for 4b and 4c

while true do

    line = turing:read("*line")
    --print("1")
    --print(line)

    if line == nil then
       break
    end

    toAdd = {}
    start,last = string.find(line,'\t')
    year = string.sub(line,0,start)
    line = string.sub(line,last+1,#line)

    --print("2")
    --print(year)
    --print(line)

    start,last = string.find(line,'\t')
    name = string.sub(line,0,start)
    line = string.sub(line,last+1,#line)

    --print("3")
    --print(name)

    start,last = string.find(line,'\t')
    area = string.sub(line,0,start)
    line = string.sub(line,last+1,#line)

    --print("4")
    --print(area)

    --start,last = string.find(line,'\t')
    --place = string.sub(line,0,start)

    --print("5")
    --print(line)

    toAdd = {year, name, area, line}
    keysOfArea[area]= toAdd
    keysOfPlace[line] = toAdd

end
turing:close()

-- 4b. Sort the table by Area of Research

local tkeys = {}

-- populate the table that holds the keys
for k in pairs(keysOfArea) do
    table.insert(tkeys, k)
end

-- sort the keys
table.sort(tkeys)

-- use the keys to retrieve the values in the sorted order
for i,v in ipairs(tkeys) do
    loc = keysOfArea[v]
    print(loc[1].." "..loc[2].." "..loc[3].." "..loc[4])
end

-- 4c. Sort the table by Institution of Winner
local tkeys = {}
-- populate the table that holds the keys
for k in pairs(keysOfPlace) do
    table.insert(tkeys, k)
end

-- sort the keys
table.sort(tkeys)

-- use the keys to retrieve the values in the sorted order
for i,v in ipairs(tkeys) do
    loc2 = keysOfPlace[v]
    print(loc2[1].." "..loc2[2].." "..loc2[3].." "..loc2[4])
end
