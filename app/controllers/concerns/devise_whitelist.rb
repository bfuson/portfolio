module DeviseWhitelist
  extend ActiveSupport::Concern
  
  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
        # course example used "before_filter", but this was flagged as an unkown method,  
        # suggested "before_filter" once changed to "before_action" it seems to work properly.
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end