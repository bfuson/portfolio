class PortfoliosController < ApplicationController

    def index
     @portfolio_items = Portfolio.all         # bring back all portfolio items
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
    end
    
    def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))   
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
   @portfolio_item = Portfolio.find(params[:id])
   
end

def edit 
  @portfolio_item = Portfolio.find(params[:id])
end

def destroy    # does not have a template, so do not need to add a destroy.html.erb file to portfolios folder
  # two options here:     destroy, delete
  # delete()    executes the SQL delete verb, simply delete the db item, no checks, strictly within the db
  # destroy()  checks other links / dependencies within the application, will not permit deletion if there are other dependencies

    # do the look up
    @portfolio_item = Portfolio.find(params[:id])   
    
    # destroy/delete the record
    @portfolio_item.destroy
    
    # redirect 
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio Record #{@portfolio_item.id} was successfully destroyed.' }
    end
end

def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice:  'The record was successfully updated.' }       
              # portfolios_path is the relative path.    portfolios_url  would be the entire path which could be sent as a link for access
      else
        format.html { render :edit }
      end
    end
  end
  
end   # end class PortfoliosController definition