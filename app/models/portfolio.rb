class Portfolio < ApplicationRecord
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
      self.main_image ||= "http://via.placeholder.com/600x200/000FF/000000"
      self.thumb_image ||= "http://via.placeholder.com/350x200/000000/FFFFFF"
    end
end
