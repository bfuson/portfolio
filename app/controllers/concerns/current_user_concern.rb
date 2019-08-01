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
     OpenStruct.new(name: "Guest User", 
                    first_name: "Guest",
                    last_name: "User", 
                    email: "guest_user@test.com"
                    )
   end
end 