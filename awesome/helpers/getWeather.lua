#!/bin/lua

local function readFile(path)
	local f = io.open(path)
	local output = {}
	local index = 0
	for line in f:lines() do
		output[index] = line
		index = index + 1
	end
	return output
end

local function getWeather()
	local json = require("lunajson")
	local ltn12 = require("ltn12")
	local path = string.format("%s/.config/awesome/open_weather", os.getenv("HOME"))
	local credentials = readFile(path)
	local http = require("socket.http")
	local body = {}
	local res, code, headers, status = http.request({
		url = "https://api.openweathermap.org/data/2.5/weather?id=" .. credentials[0] .. "&appid=" .. credentials[1],
		sink = ltn12.sink.table(body),
	})
	local response = table.concat(body)
	local content = json.decode(response)
	local temperature = math.floor((content.main.temp - 273.15) + 0.5)
	local description = content.weather[1].main

	print(temperature)
	print(description)
end

getWeather()
