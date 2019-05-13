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

end
