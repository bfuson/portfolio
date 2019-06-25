class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #  :lockable = the ability to lock an ID based on defined criteria such as too many consecutive login fails
  #  :omniauthable  is used to enable 3rd party authentications
  # created by command:     Bills-iMac:DevcampPortfolio williamfuson$ rails g devise:views
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
     
     
   validates_presence_of :name
      # security protection to ensure a name field / value is present
          
   def first_name
     # extract first name from the name field
     self.name.split.first    
        # split the name field into an array of values separated by spaces or specified argument such as a comma
        # returns the first element of the array
        #  if name = "John Smith"
        #  self.split.name  ==>  ["John","Smith"]
        #  self.split.name.first  ==>   "John"
     
   end
   
   def last_name
     self.name.split.last 
   end
   
end