module DefaultPageContent
   extend ActiveSupport::Concern
  
  included do
    before_action :set_page_defaults
        # course example used "before_filter", but this was flagged as an unkown method,  
        # suggested "before_filter" once changed to "before_action" it seems to work properly.
  end
  
  def set_page_defaults
    @page_title = "Devcamp Portfolio | My Portfolio Website"  #  the default page title.
    @seo_keywords = "Make up a keyword"    # an example of using one code set search engine optimization keywords
  end 
  
end 