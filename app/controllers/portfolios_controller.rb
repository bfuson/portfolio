class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
    # do this so that can refactor to remove duplicate code below in each of the methods specified in the before_action line
    # edit, destroy, update, show 
    # note that the :set_portfolio_item  method is specified in the private section.
  
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
   
    def index
     @portfolio_items = Portfolio.all         # bring back all portfolio items
#         ALTERNATIVE CODE OPTIONS NOT USED IN THIS COURSE.
#      @portfolio_items = Portfolio.where(subtitle: 'Angular')   # bring back all Angular items
#      @portfolio_items = Portfolio.where(subtitle: 'Ruby on Rails')   # bring back all Ruby on Rails items
#      @portfolio_items = Portfolio.ruby_on_rails_portfolio_items      #  this uses the custom scope defined in portfolio.rb
#      @portfolio_items = Portfolio.angular   #  this uses the custom scope defined in portfolio.rb
      
    end  
    
    def angular
      @angular_portfolio_items   = Portfolio.angular   #  list of angular portfolio items 
    end
    
    def ruby_on_rails
      @ruby_on_rails_portfolio_items = Portfolio.ruby_on_rails
    end
    
    def new   # method to begin building a new portfolio item
      @portfolio_item = Portfolio.new      #  get the Portfolio information for display
      3.times { @portfolio_item.technologies.build }  # builds 3 technologies for the item.
                                                      # this is not the desireable approach since it limits to only 3 
                                                       # want an approach where the number of additions is variable from 0 - n
    end
    
    def create
    @portfolio_item = Portfolio.new(portfolio_params)   
                                  # this passes parameters, and specifies the permitted parms that can be passed to the app
        # POST /portfolio_item
        # POST /portfolio_item.json
       respond_to do |format|
         if @portfolio_item.save
           format.html { redirect_to portfolios_path, notice: 'Your Portfolio item is now live.' }  #  adds to the full list of portfolio_items, not the show page
           format.json { render :show, status: :created, location: @portfolio_item }   # displays on the show page?
         else
           format.html { render :new }
           format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
         end    #  end if...else...block
      end   #  end respond_to do......   block
   end    #  end Portfolios create method

def show
      # specific record to show was identified in the before action ":set_portfolio_item"
      # which calls the private method set_portfolio_item
end

def edit 
      # specific record to edit was identified in the before action ":set_portfolio_item"
      # which calls the private method set_portfolio_item
end

def destroy    # does not have a template, so do not need to add a destroy.html.erb file to portfolios folder
  # two options here:     destroy, delete
  # delete()    executes the SQL delete verb, simply delete the db item, no checks, strictly within the db
  # destroy()  checks other links / dependencies within the application, will not permit deletion if there are other dependencies
  # specific record to destroy was identified in the before action ":set_portfolio_item"
  # which calls the private method set_portfolio_item
  
  # destroy/delete the record
    @portfolio_item.destroy
    
    # redirect 
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio Record #{@portfolio_item.id} was successfully destroyed.' }
    end
end

def update
    # specific record to update was identified in the before action ":set_portfolio_item"
    # which calls the private method set_portfolio_item
    
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice:  'The record was successfully updated.' }       
              # portfolios_path is the relative path.    portfolios_url  would be the entire path which could be sent as a link for access
      else
        format.html { render :edit }
      end
    end
  end
  
  private
       #  reminder - private means that the methods from this point on are only visible to methods within this class
       #  they cannot be accessed by other classes.
       
    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle, 
                                        :body, 
                                         technologies_attributes: [:name]
                                         )
    end
    
   def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
   end  

end   # end class PortfoliosController definition