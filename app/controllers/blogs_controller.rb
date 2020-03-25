class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
      # commands that the set_blog method is called before anything else happens.  set_blog:only ....
      # means that only the set_blog method is run
      # this eliminates the need for duplicate code in each method to set_blog.
      # note that the set_blog method is a private method created towards the end of this file.
      
  layout "blog"
  
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all
      # this adds role action specifications to be used by petergate gem for authorizations
      #  all users will be able to show and index blog entries
      #  users cannot do :destroy, :new, :create, :update, :edit
      # site_admin can do everything
  
      # specifies the layout file to use for blogs.  "app/views/layouts/blog.html.erb"
      # since  -  layout - is just a Ruby method with the argument "blog" could also use
      #  layout("blog")   but the convention is    layout "blog"

  
     # GET /blogs
     # GET /blogs.json
     
  def index
            # @blogs = Blog.all    
            # could change this to     @blogs = Blog.limit(1)   
            # to limit the app to just one blog.
            # binding.pry      # set break point         
    @blogs = Blog.special_blogs     # will define how many blog entries to process
            # binding.pry      # set break point  
            # @blogs = Blog.featured_blogs    # this line of code was only to help demo debugging.
             # binding.pry      # set break point
             #  byebug          
             # debugging tool provided in rails 5 and above - in the Gemfile file
    @page_title = "My Portfolio Blog"     # reset the page title as appropriate for Blogs site.
                                          #  used in the applicatoin.html.erb layout code
  end

     # GET /blogs/1
     # GET /blogs/1.json
     
  def show
     @page_title = @blog.title
         # this works because of the before_action method that calls set_blog to retrieve the actual blog title
     @seo_keywords = @blog.body
  end

  # GET /blogs/new
  def new      # this creates a new instance, but does not take in any data, it has no parameters
    @blog = Blog.new    
  end
 
  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)   # this passes parameters, 
    @blog.draft!          # attempt to force status to draft for newly created blogs
                              # this fixes the issue.  New blog items are now set to draft 
                              # still not clear why the default setting failed.
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: "Blog item -- #{@blog.title} -- was successfully created"}
#        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
#        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: "Blog item -- #{@blog.title} --was successfully updated" }
#        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
#        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice:   "Blog item -- #{@blog.title} --was successfully destroyed"}
      format.json { head :no_content }   # json calls are inserted by the scaffold to support api calls, should you want them.
    end
  end

def toggle_status
  if @blog.published?
     @blog.draft!
     elsif  @blog.draft?
       @blog.published! 
     else @blog.draft!  
   end
  redirect_to blogs_url, notice: "Blog item -- #{@blog.title} -- status has been updated to:  #{@blog.status}"
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id]) 
                   #  insert the friendly Id feature - old code was:  @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :status)
    end
end
