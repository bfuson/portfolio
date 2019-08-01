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
   
end

