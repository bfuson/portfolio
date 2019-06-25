class ApplicationController < ActionController::Base
   protect_from_forgery with:  :exception   
                                      # not in the generated Controller, so added as in the class work
   before_action :configure_permitted_parameters, if: :devise_controller?
              #   before_action was before_filter ,  newer version of RAILS has apparently deprecated before_filter.
              # :configure_permitted_parameters   -   created just for the devcamp class, only available if defined in the application
              #  if:  :devise_controller?   -  means that this will be used only if active comm's with the devise controller
   def configure_permitted_parameters
     # these are specific to Rails 5
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
     devise_parameter_sanitizer.permit(:account_update, keys: [:name])
   end
end
