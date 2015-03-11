Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automaticall
    
    resources :users
    #resources :products
    resources :listings
    resources :offers

    #users 
      #create ok
      #delete ok

    #listings
      #create ok
      #delete ok

    #offers
      #create 
      #delete

    # resources :listings do
    #   resources :offers
    # end
    #resources :ratings
    

    #CUSTOM ROUTES MADE BY RANDY:

    get '/categories' => 'categories#index'
    post '/users/login' => 'users#login'
    #get '/users/upload/form' => 'users#uploadform'
    #post '/users/upload/image' => 'users#upload'
    get '/users/:user_id/listings' => "users#listings"
    get '/users/:user_id/offers' => "users#offers"
    #post 'offers/accept' => "offers#accept"
    #post 'offers/invalidate' => "offers#invalidate"


  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
