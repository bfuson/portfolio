 class Blog < ApplicationRecord
   enum status: { draft: 0, published: 1 }   #  this enum seems to be working, but the default is not set, must specifically set it at load time
   extend FriendlyId
   friendly_id  :title, use: :slugged
end
