class ApplicationController < ActionController::Base
   protect_from_forgery with:  :exception   
                                      # not in the generated Controller, so added as in the class work
   
   # include DeviseWhitelist   # present in class session 98  may need to remove, not clear when it was added.
   
   before_action :configure_permitted_parameters, if: :devise_controller?
              #   before_action was before_filter ,  newer version of RAILS has apparently deprecated before_filter.
              # :configure_permitted_parameters   -   created just for the devcamp class, only available if defined in the application
              #  if:  :devise_controller?   -  means that this will be used only if active comm's with the devise controller
   
   before_action :set_source   #  from session 98  lesson - trap the users source 
   
   def set_source
     session[:source] = params[:q] if params[:q]    
                                  # session 98  collect user's source info - if it is available.
                                  #  assumes that q is set in the browser:    e.g. localhost:3000/portfolio/4?q=twitter
   end
   
   def configure_permitted_parameters
     # these are specific to Rails 5
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
     devise_parameter_sanitizer.permit(:account_update, keys: [:name])
   end
end
