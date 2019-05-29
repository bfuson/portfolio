module Placeholder
  extend ActiveSupport::Concern
  
  def self.image_generator(height:, width:)
       "http://via.placeholder.com/#{height}x#{width}/000FF/000000"
   end 
end 