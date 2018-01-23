require 'holidays/core_extensions/date'
require 'Date'
require 'open_weather'

class Date
  include Holidays::CoreExtensions::Date

  # def season
  #   # Not sure if there's a neater expression. yday is out due to leap years
  #   day_hash = month * 100 + mday
  #   case day_hash
  #     when 1201..1231, 101..301 then :winter
  #     when 302..531 then :spring
  #     when 601..831 then :summer
  #     when 901..1130 then :fall
  #   end
  # end
end


class HomeController < ApplicationController
  # def index
  #   catego = Category.find_by name: 'holiday'
  #   today = Time.now.to_date
  # 	today = Date.civil(2018,2,16)
  # 	# season = today.season

  # 	if today.holiday?(:kr)
  # 		if catego.priority === 1
  # 			holi=Holidays.on(today,:kr)[0][:name]
  # 			@banner = Banner.find_by name: holi
  # 		else
  # 			@banner = Banner.find_by name: season
  # 		end
  # 	else
  # 		@banner = Banner.find_by name: season
  # 	end
  #   @code = Recommend.find_by banner_id: @banner.id
  #   # weather
  #   options = { units: "metric", APPID: "ee91ae8a96a41933de679492dd6d7d07" }
  #   options[:lang] = "kr"
  #   weather=Weather.find_by choose: 1
  #   @today = OpenWeather::Current.geocode(weather.lat, weather.lon, options)
    
  #   # icon http://openweathermap.org/img/w/10d.png
  #   icon = @today["weather"][0]["icon"]
  #   @icon_link = "http://openweathermap.org/img/w/"+icon+ ".png"
  # end

  def index
    # 1. 우선순위 1순위, 2순위, 아님 그 다음 순위가 뜨도록 비교문(카테고리)
    # 2. 우선순위가 높은 배너모델의 시작날짜, 끝날짜 비교
    # 3. 그 사이에 없으면 2순위가 되도록
    # https://stackoverflow.com/questions/2381718/rails-activerecord-date-between
    today = Time.now.to_datetime
    #today = Date.civil(2018,2,16)
  
    (1..Category.count).each do |i|
      catego_id = Category.find_by priority: i
      puts catego_id.name
      catego = Banner.where category_id: catego_id.id
      catego.each do |f|
        if f.sdate <= today and today <= f.edate
          @banner = f
          puts @banner.name
          break
        end
      end
      if !@banner.nil?
        puts @banner.name
        break
      end
    end
    @code = Recommend.find_by banner_id: @banner.id

    # weather
    options = { units: "metric", APPID: "ee91ae8a96a41933de679492dd6d7d07" }
    options[:lang] = "kr"
    weather=Weather.find_by choose: 1
    @today_weather = OpenWeather::Current.geocode(weather.lat, weather.lon, options)
    
    # icon http://openweathermap.org/img/w/10d.png
    icon = @today_weather["weather"][0]["icon"]
    @icon_link = "http://openweathermap.org/img/w/"+icon+ ".png"

    # 12월 01일이 되는 순간 계절 DB에 + 1년해주기
    if today.strftime("%m%d%H%M") == "12010000"
      season = Banner.where category_id: 2
      season.each do |s|
        s.sdate+1.year.to_i
        s.edate+1.year.to_i
        s.save
      end
    end
  end
end