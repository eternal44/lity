Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show, :destroy] do
    resources :friend_requests, shallow: true do
    end
  end

  # for friendship associations
  resources :friends, only: [:destroy]
  
  
  resources :groups do
    resources :archives, module: :groups
    resources :memberships, module: :groups
    resources :comments, module: :groups
  end

  resources :archives, only: [] do
    resources :comments, module: :archives
  end
  
  #root
  authenticated :user do
    root to: "users#index", as: :authenticated_root, via: :get
  end

  unauthenticated do
    root to: "static_pages#home"
  end




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
