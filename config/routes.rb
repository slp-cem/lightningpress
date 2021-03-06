LightningPress::Application.routes.draw do

  get "request_comments/index"
  get "lt_schedule/index"
  get "candidates/:id/disable" => "candidates#disable", as: :candidates_disable
  get "lt_requests/:id/disable" => "lt_requests#disable", as: :lt_requests_disable
  get "lt_comments/:id/disable" => "lt_comments#disable", as: :lt_comments_disable
  get "request_comments/:id/disable" => "request_comments#disable", as: :request_comments_disable
  put "candidates/:id/choose" => "candidates#choose", as: 'choose_candidate'
  get "request_to" => "lt_requests#request_to"

  root :to => "users#top"
  resources :users
  resources :lt_requests
  resources :lt_comments
  resources :logins
  resources :request_comments, except: :index
  resources :candidates
  resources :lightningtalks
  get "lightningtalks/:id/archive" => "lightningtalks#archive", as: :lightningtalk_id
  resources :lt_schedule
  resources :request_notifications
  
  namespace "admin" do
    resources :members
  end

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
