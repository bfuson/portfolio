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
        format.html { redirect_to portfolios_path, notice: 'Your Portfolio item is now live.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end
end
