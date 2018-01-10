class Category < ApplicationRecord
  has_many :banners, dependent: :destroy
 
  before_validation :priority_confirm
  after_destroy :back_priority

  validates :priority, uniqueness: true 
  private
    def priority_confirm
      categories = Category.all
      if priority_was.nil?
      	puts self.priority
      	categories.each do |c|
				  if self.priority <= c.priority
				    	c.priority+=1
				  end
				  c.save(validate: false)
				end
      else
	      categories.each do |c|
			    if self.priority_was > self.priority
				  	if self.priority <= c.priority and c.priority<self.priority_was
				    	c.priority+=1
				  	end
					elsif self.priority_was < self.priority
				  	if self.priority >= c.priority and c.priority>self.priority_was
				    	c.priority-=1			    
				  	end
			    end
			    c.save(validate: false)
			  end
		  end
		end
		def back_priority
      categories = Category.all
      categories.each do |c|
      	if self.priority < c.priority
      		c.priority-=1
      	end
      	c.save(validate: false)
      end
	  end
end