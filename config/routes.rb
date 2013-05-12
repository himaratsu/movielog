Movielog::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  match 'top/'            => 'top#index',  :as => :top

  resources :movies, :users, only: [:index, :show]
  resource :reviews
  match 'search/movie/'   => 'search#movie', :as => :search_movie
  match 'search/user/'    => 'search#user', :as => :search_user
  match 'friends/follow/:id'   => 'friends#follow',   :as => :friend_follow
  match 'friends/unfollow/:id' => 'friends#unfollow', :as => :friend_unfollow
  match 'search/movie/'        => 'search#movie',     :as => :search_movie
  match 'search/user/'         => 'search#user',      :as => :search_user
  match 'mypage'         => 'mypage#index',     :as => :mypage
  match 'movies/sort/:key'    => 'movies#sort', :as => :movies_sort

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'top#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
