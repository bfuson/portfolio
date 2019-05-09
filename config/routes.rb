#  NOTE - if change the routes.rb file, then must restart the rails server before running the changed code.

# adding custom routes

Rails.application.routes.draw do

  resources :portfolios, except: [:show]   
                          # option to move a route from the default to a custom one for resource portfolios
  get 'portfolio/:id' , to: 'portfolios#show' , as: 'portfolio_show' 
  
  get 'about-me', to: 'pages#about'        #   this line replaces - 'pages/about'    both will work, 
                                                              # with 'pages/about'  rails assumes that about is the method 
                                                              #  can change the presentation to    get 'about-me', to: 'pages#about'  and it will display
                                                              #  about even though localhost:3000/about-me   is used as the link.
  get 'contact', to: 'pages#contact'         # 'this line replaces - pages/contact'  
  
  resources :blogs do
    member do
      get :toggle_status 
    end
  end
                                                 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
 