class Skill < ApplicationRecord
  include Placeholder        #  helper file in models/concerns directory
  validates_presence_of :title, :percent_utilized
  
   after_initialize :set_defaults
  
   def set_defaults
      self.badge ||= Placeholder.image_generator(height: '250', width: '250')
              #  || is equivalent to saying that if badge is "ni;" reset it to the following value 
   end 
end
   