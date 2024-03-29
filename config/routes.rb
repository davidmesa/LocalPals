LocalPals::Application.routes.draw do

  root 'application#index'

  resources :users
  resources :activities

  get '/user/get_user' => 'users#get_user'
  put '/user/get_user' => 'users#get_user'

  post '/user/login' => 'users#login'

  get 'traveler/feed' => 'feed_traveler#show'

  post 'traveler/addCity' => 'feed_traveler#addCity'

  get '/traveler/addActivity' => 'feed_traveler#addActivity'

  post '/traveler/addReview' => 'feed_traveler#addReview'

  get 'traveler/BasicSearchInfo' => 'search#basicInfo'

  get '/traveler/search' => 'search#search'

  get '/traveler/review' => 'feed_traveler#showReview'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
