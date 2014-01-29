BlogTest::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"
  # resources :users
  # resources :sessions,only:[:new,:create,:destroy] 
  root :to => "sessions#new"
  get "/users" =>"users#index", :as=>:users
  get "/users/:id" =>"users#show", :as=>:user
  post "/users"=>"users#create"
  get "/users" => "users#new",:as=>:signup
  get "/sessions" =>"sessions#new",:as=>:signin
  post "/sessions" => "sessions#create"
  delete "/sessions" => "sessions#destroy", :as =>:signout
  get "/users/:id/edit"=>"users#edit", :as => :edit_user
  patch "/users/:id" =>"users#update", :as=>:update_user
  delete "/users/:id" =>"users#destroy",:as=>:delete_user
  get "/posts" => "posts#index", :as=>:posts
  delete "/posts/:id" => "posts#destroy", :as=> :post_delete
  post "/posts"=>"posts#create", :as=>:posts_create
  # get "/posts" =>"post#show" , :as => :post_show

  # delete "/signout" =>"sessions#destroy"
 
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
