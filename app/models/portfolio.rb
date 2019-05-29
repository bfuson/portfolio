class Portfolio < ApplicationRecord
  has_many :technologies
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image
  
  def self.angular
    where(subtitle: 'Angular')
  end
  
   def self.ruby_on_rails
     where(subtitle: 'Ruby on Rails') 
   end
  
        # another option is to use Ruby lamda
      #  scope  <reference name>, -> { where( <field name> <criteria>) }:
#     scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

    after_initialize :set_defaults  #  executed after an item's  new method is executed.
    
    def set_defaults
      self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
              #  || is equivalent to saying that if main_image is "ni;" reset it to the following value
      self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end 
