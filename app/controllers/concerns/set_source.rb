module SetSource
  extend ActiveSupport::Concern
  
  included do
    before_action :set_source
  end   # course example used "before_filter", but this was flagged as an unkown method,  suggested "before_filter"
        # once changed to "before_action" it seems to work properly.

  def set_source
    session[:source] = params[:q] if params[:q]
  end
end