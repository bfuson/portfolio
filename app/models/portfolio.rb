class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
  reject_if: lambda { |attrs|  attrs ['name'].blank?}
                                  # this will allow entry of >1 technology when creating a new portfolio item
                                  #  need to add any desired data validations such as ensuring the name attribute is not blank.
                                  # test the addition of multiple technologies using the rails console (rails c) with the following command:
                                  #
                                  # Portfolio.create!( title: "Web app", subtitle: "subtitle test", body: "subtitle test body text", technologies_attributes: [{name: "Ruby"}, {name: "Rails"}, {name: "Angular"}, {name: "Ionic"}])
                                  #
                                  # This actually adds four technoloiges to the single portfolio item
                                  
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image
  
  def self.angular
    where(subtitle: 'Angular')
  end
  
   def self.ruby_on_rails
     where(subtitle: 'Ruby on Rails') 
   end
  
      #  another option is to use Ruby lamda
      #  scope  <reference name>, -> { where( <field name> <criteria>) }:
      # scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

    after_initialize :set_defaults  #  executed after an item's  new method is executed.
    
    def set_defaults
      self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
              #  || is equivalent to saying that if main_image is "ni;" reset it to the following value
      self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end 
