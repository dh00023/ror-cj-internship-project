class Weather < ApplicationRecord
 before_validation :choose_confirm

  private
    def choose_confirm
      weathers = Weather.all
      weathers.each do |w|
        puts choose
        puts w.choose
        puts w.choose === choose
        if w.choose === choose
          w.choose = 1
        end    
        w.save(validate: false)
      end
    end
end

# weathers = Weather.all
# weathers.each do |w|
#   w.choose=w.id
#   w.save
# end