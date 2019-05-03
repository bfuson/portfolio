#  NOTE - if change the routes.rb file, then must restart the rails server before running the changed code.


Rails.application.routes.draw do
  resources :portfolios
  
  get 'about-me', to: 'pages#about'        #   this line replaces - 'pages/about'    both will work, 
                                                        # with 'pages/about'  rails assumes that about is the method 
                                                        #  can change the presentation to    get 'about-me', to: 'pages#about'  and it will display
                                                         #  about even though localhost:3000/about-me   is used as the link.
  get 'contact', to: 'pages#contact'    # 'this line replaces - pages/contact'  
  
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'pages#home'
end
