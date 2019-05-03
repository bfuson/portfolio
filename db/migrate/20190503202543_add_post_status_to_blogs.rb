class AddPostStatusToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :status, :integer,  default: 0  
                    # the default was not added by rails g migrate command, so add it manually in the code
  end
end
 