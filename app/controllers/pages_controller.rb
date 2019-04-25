class PagesController < ApplicationController
  def home
    @posts = Blog.all  # store all blog posts in the instance variable @posts
    @skills = Skill.all   #  look at the skills data
  end

  def about
  end

  def contact
  end
end
