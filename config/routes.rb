OaspCookieOverflow::Application.routes.draw do
  devise_for :users
  
  resources :bid_items
  resources :bid_item_comments, :only=> [:create, :destroy]
  resources :tags, :only=> [:create, :update, :destroy]
  resources :bids, :only=> [:create, :destroy]
  resources :auto_inc_requests, :only=> [:create, :destroy]

  #map.thumbsup 'rating/thumbsup', :controller => "rating", :action => "thumbsup"
  match 'rating/thumbsup' => 'rating#thumbsup', :as => :thumbsup
  
  #map.thumbsdown 'rating/thumbsdown', :controller => "rating", :action => "thumbsdown"
  match 'rating/thumbsdown' => 'rating#thumbsdown', :as => :thumbsdown

  #map.search_bid_items 'search/bid_item', :controller => "search", :action => "bid_item"
  match 'search/bid_item' => 'search#bid_item', :as => :search_bid_items
  
  #map.search_users 'search/user', :controller => "search", :action => "user"
  match 'search/user' => 'search#user', :as => :search_users
  
  #map.inbox 'inbox', :controller => "messaging", :action => "manage"
  match 'inbox' => 'messaging#manage', :as => :inbox
  
  #map.message_create 'messaging/create', :controller => "messaging", :action => "create"
  match 'messaging/create' => 'messaging#create', :as => :message_create
  
  #map.read_message 'messaging/read/:id', :controller => "messaging", :action => "read"
  match 'messaging/read/:id' => 'messaging#read', :as => :read_message
  
  match 'admin/select_user' => 'admin#select_user', :as => :admin_select_user
  match 'admin/support' => 'admin#mail', :as => :admin_support
  match 'admin/send_mail' => 'admin#send_mail', :as => :admin_mail
  match 'admin/become_seller' => 'admin#become_seller', :as => :become_seller
  match 'admin/edit_user_permissions' => 'admin#edit_user_permissions', :as => :admin_edit_user
  match 'admin/change_user_permissions' => 'admin#change_user_permissions', :as => :admin_edit_user_commit
  
  
  root :to => "bid_items#index"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
