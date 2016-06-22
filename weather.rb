# Weather App Project

# This is your BIG Skillcrush 104 class project!
# You will create a weather app that allows a user to input their location
# (zip code, city, state, etc.), hit submit, and then, depending on 
# real-time data that you will source from a public API, see a message 
# customized to what the weather is like where they live.

require 'barometer'

# STEP 1: USER INPUTS THEIR LOCATION
# The user will tell you where they are by submitting their zipcode, 
# city, landmark or Woe ID!
#puts "What is your location? Provide your zipcode, city, landmark or Woe ID."
#answer = gets.capitalize
#puts answer
answer = "Paris"

# STEP 2: YOU USE A PUBLIC API TO FIND OUT WHAT THE WEATHER IS IN 
# THEIR AREA
# This all happens behind the scenes! And you will be using the 
# Barometer Gem.

barometer = Barometer.new(answer)
weather = barometer.measure
result = weather.current

# Puts all methods and properties in weather
#puts weather.current.inspect

# STEP 3: DEPENDING ON THE WEATHER, YOU WILL SERVE THEM ONE OF THE 
# FOLLOWING SCREENS
# If it’s sunny: it’s 85 degrees and sunny!
# If it’s cloudy: 55 degrees and crazy cloudy!
# If it’s rainy: 60 degrees and crazy rainy!
# If it’s snowy: 32 degrees and super snowy!

# Condition (sunny, clear, rainy, etc.)
condition = result.icon

# Temperature
temp = result.temperature

puts "Currently in #{answer}: #{temp} and #{condition}!"

# Part II. Use your gem to figure out the forecast for the next
# five days.
#puts weather.forecast.inspect

# Methods: icon, temperature, starts_at, ends_at(YYYY-MM-DD)
today = Time.new.day 
tomorrow = Time.now.strftime("%d").to_i + 1

puts "today " + today.to_s + " and tomorrow " + tomorrow.to_s

# if weather.forecast[0].starts_at.strftime("%d").to_i === tomorrow
# 	puts "Tomorrow"
# else
# 	puts 
# end

# puts weather.forecast[0].starts_at.strftime("%d")

weather.forecast.each do |item|
	if item.starts_at.strftime("%d").to_i === tomorrow.to_i
		item_day = "Tomorrow"
	else
		item_day = item.starts_at.strftime("%A")
	end

	puts item_day + "'s forecast is: " + item.icon + ", with a low of " + item.low + " and a high of " + item.high + " degrees Celsius."
end


# weather.forecast.each do |item|
# 	if  today + 1 == first_forecast_date
# 		puts "Tomorrow's forecast is: " + item.icon + ", with a low of " + item.low + " and a high of " + item.high + " degrees Celsius "
# 	else
# 		puts item.ends_at.strftime("%A").to_s + "'s forecast is: " + item.icon + ", with a low of " + item.low + " and a high of " + item.high + " degrees Celsius " 
# 	end
# end
