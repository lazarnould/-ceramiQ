Rails.application.routes.draw do
  get 'specifications/index'

  get 'specifications/show'

  get 'specifications/new'

  get 'specifications/create'

  get 'specifications/edit'

  get 'specifications/update'

  get 'specifications/destroy'

  get 'products/index'

  get 'products/show'

  get 'products/new'

  get 'products/create'

  get 'products/edit'

  get 'products/update'

  get 'products/destroy'

  get 'order_lines/index'

  get 'order_lines/show'

  get 'order_lines/new'

  get 'order_lines/create'

  get 'order_lines/edit'

  get 'order_lines/update'

  get 'order_lines/destroy'

  get 'orders/index'

  get 'orders/show'

  get 'orders/new'

  get 'orders/create'

  get 'orders/edit'

  get 'orders/update'

  get 'orders/destroy'

  get 'delivery_infos/index'

  get 'delivery_infos/show'

  get 'delivery_infos/new'

  get 'delivery_infos/create'

  get 'delivery_infos/edit'

  get 'delivery_infos/update'

  get 'profile/index'

  get 'profile/show'

  get 'profile/new'

  get 'profile/create'

  get 'profile/edit'

  get 'profile/update'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
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
