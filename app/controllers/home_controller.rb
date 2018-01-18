require 'holidays/core_extensions/date'
require 'Date'
require 'open_weather'

class Date
  include Holidays::CoreExtensions::Date

  def season
    # Not sure if there's a neater expression. yday is out due to leap years
    day_hash = month * 100 + mday
    case day_hash
      when 1201..1231, 101..301 then :winter
      when 302..531 then :spring
      when 601..831 then :summer
      when 901..1130 then :fall
    end
  end
end


class HomeController < ApplicationController
  def index
    catego = Category.find_by name: 'holiday'
  	#today = Time.now.to_date
  	today = Date.civil(2018,12,25)
  	season = today.season

  	if today.holiday?(:kr)
  		if catego.priority === 1
  			holi=Holidays.on(today,:kr)[0][:name]
  			@banner = Banner.find_by name: holi
  		else
  			@banner = Banner.find_by name: season
  		end
  	else
  		@banner = Banner.find_by name: season
  	end
    @code = Recommend.find_by banner_id: @banner.id
    # weather
    options = { units: "metric", APPID: "ee91ae8a96a41933de679492dd6d7d07" }
    options[:lang] = "kr"
    weather=Weather.find_by choose: 1
    @today = OpenWeather::Current.geocode(weather.lat, weather.lon, options)
    
    # icon http://openweathermap.org/img/w/10d.png
    icon = @today["weather"][0]["icon"]
    @icon_link = "http://openweathermap.org/img/w/"+icon+ ".png"
  end
end