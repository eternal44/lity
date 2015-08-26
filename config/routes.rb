Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show, :destroy] do
    resources :friend_requests, shallow: true do
    end
  end

  # for friendship associations
  resources :friends, only: [:destroy]

  resources :groups do
    scope module: 'groups' do
      resources :archives
      resources :memberships
      resources :comments
    end
  end

  resources :archives, only: [] do
    resources :comments, module: :archives
  end

  # logged-in root
  authenticated :user do
    root to: "users#index", as: :authenticated_root, via: :get
  end

  # visitors root
  unauthenticated do
    root to: "static_pages#home"
  end
end
