require 'holidays/core_extensions/date'
require 'Date'
class Date
  include Holidays::CoreExtensions::Date

  def season
    # Not sure if there's a neater expression. yday is out due to leap years
    day_hash = month * 100 + mday
    case day_hash
      when 101..401 then :winter
      when 402..630 then :spring
      when 701..930 then :summer
      when 1001..1231 then :fall
    end
  end
end


class HomeController < ApplicationController
  def index
  	catego = Category.find_by name: 'holiday'
  	today = Time.now.to_date
  	#today = Date.civil(2018,1,1)
  	season = today.season
  	
  	if today.holiday?(:kr)
  		if catego.priority === 0
  			holi=Holidays.on(today,:kr)[0][:name]
  			@banner = Banner.find_by name: holi
  		else
  			@banner = Banner.find_by name: season
  		end
  	else
  		@banner = Banner.find_by name: season
  	end
  end
end
