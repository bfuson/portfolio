class ApplicationController < ActionController::Base
   protect_from_forgery with:  :exception   
                                      # not in the generated Controller, so added as in the class work
   
  include DeviseWhitelist   
  include SetSource
  include CurrentUserConcern        #  ensure there is no conflict with another module

   
   def configure_permitted_parameters
     # these are specific to Rails 5
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
     devise_parameter_sanitizer.permit(:account_update, keys: [:name])
   end
   
   def current_user   
     super || guest_user
      # if super is true it means that there is a current user defined. 
      # overwrites the standard current_user method copied from the devise gem
      # if there is a current legit user signed in - then use the current_user method exactly as the gem is coded.
      # memics 
      # if there is now current user defined, the CurrentUserConcern module will be called to provide a guest user
   
   end
   
end
