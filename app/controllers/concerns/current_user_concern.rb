module CurrentUserConcern
  extend ActiveSupport::Concern
  
  def current_user    
      # overwrites the standard current_user method copied from the devise gem
      # if there is a current legit user signed in - then use the current_user method exactly as the gem is coded.
      # memics 
     super || guest_user
      
      #  The purpose here is to, provide data to mimic a user definition
      #  when need to determine if the user is real or a guest - check class type.  
      #  name.is_a?(OpenStruct)  == or ==
      #  name.class
   end
   
   def guest_user
     #  OpenStruct.new(name: "Guest User", 
     #                 first_name: "Guest",
     #                 last_name: "User", 
     #                 email: "guest_user@test.com"
     #                 )
        # this OpenStruct code mimics the data of a user.  But does not fit the bill for petergate 
        # authorization and methods for ActiveRecord and petergate.  So later in the course this code
        # is replaced with the following.
        # created a new guest_user.rb file in the models folder
        
     guest = GuestUser.new
     guest.name = "Guest User"
     guest.first_name = "Guest"
     guest.last_name = "User"
     guest.email = "guest@example.com"
     guest  # this ensures that the entire object "guest" is returned.
   end   
end 