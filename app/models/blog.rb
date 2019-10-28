 class Blog < ApplicationRecord
   enum status:  { draft: 0, published: 1 }
   extend FriendlyId
   friendly_id  :title, use: :slugged
   
   validates_presence_of  :title, :body  
                        # this validation causes the Blog creation to abend if fields are missing
                        #  it works normally for the portfolios items.  Unknown about the skills table.
   belongs_to :topic
   
   
   def self.special_blogs
     all        #  retrieve all blog records
   end
   
   def self.featured_blogs
     limit(2)
          #  only retrieve 2 blog records
   end
end
