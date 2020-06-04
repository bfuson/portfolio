module PortfoliosHelper
   def image_generator(height:, width:)
      "http://placehold.it/#{height}x#{width}"
   end   
   
   def portfolio_img img, type
      if img.model.main_image? || img.model.thumb_image?
         img    # if an image exists, just return it
      elsif type == "thumb"
         image_generator(height: '350', width: '200')
      else    # assumes if not type thumb, then must me type main
         image_generator(height: '600', width: '400')
      end
   end 
end
