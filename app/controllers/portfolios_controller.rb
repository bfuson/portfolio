class PortfoliosController < ApplicationController

    def index
      @portfolio_items = Portfolio.all
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