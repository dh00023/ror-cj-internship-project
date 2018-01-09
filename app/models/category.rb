class Category < ApplicationRecord
  has_many :banners
 
  before_validation :priority_confirm

  validates :priority, uniqueness: true 
  private
    def priority_confirm
      categories = Category.all
      if !priority_was.nil?
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
end