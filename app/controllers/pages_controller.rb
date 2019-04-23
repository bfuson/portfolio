class PagesController < ApplicationController
  def home
    @posts = Blog.all  # store all blog posts in the instance variable @posts
  end

  def about
  end

  def contact
  end
end
