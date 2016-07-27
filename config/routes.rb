Rails.application.routes.draw do


  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :profiles, except: [:destroy]

  resources :categories, only: [:new, :create] do
    resources :products, only: [:new, :create]
  end

  resources :products, except: [:new, :create, :index] do
      resources :order_lines, only: [:new, :create]
      resources :specifications, except: [:destroy] do
        resources :images, only: [:create, :update]
      end
  end

  resources :order_lines, only: [:destroy, :edit, :update]
  resources :categories, only: [:destroy, :show]

  resources :orders, only: [:show, :create, :index] do
    resources :payments, only: [:new, :create]
    resources :delivery_infos, except: [:destroy, :index]
  end


  get '/categories/:id/men', to: 'categories#show_men', as: :men_categories

  get '/categories/:id/women', to: 'categories#show_women', as: :women_categories

  get '/categories/:id/accessories', to: 'categories#show_accessory', as: :accessories_by_sport

  get '/men', to: 'products#index_men', as: :men_products

  get '/women', to: 'products#index_women', as: :women_products

  get '/accessories', to: 'products#index_accessories', as: :accessories

  get '/basket', to: 'orders#current_order', as: :current_order






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
