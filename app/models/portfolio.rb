class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                 reject_if: lambda { |attrs|  attrs ['name'].blank?}
                                  
  validates_presence_of :title, :body
  
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader
      # mount_uploader  is a carrier wave method, these calls to carrierwave causes 
      # application failure, no model, image at specified location.
      # commenting these two lines out allows app to run, albeit without the file upload
      # capability - need to resolve.
      
  def self.angular
    where(subtitle: 'Angular')
  end
  
  def self.by_position
     order("position ASC")
  end
  
  def self.ruby_on_rails
     where(subtitle: 'Ruby on Rails') 
  end
  
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
end 


  