Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  devise_for :sponsors, skip: [:sessions]

  devise_scope :sponsors do
    get '/sign_in'    => 'sponsors/sessions#new', :as => :new_sponsor_session
    match '/sign_in'  => 'sponsors/sessions#new', :as => :new_session, via: 'get'
    post 'sign_in'    => 'sponsors/sessions#create', :as => :create_session
    delete 'sign_out' => 'sponsors/sessions#destroy', :as => :destroy_session
    match 'sign_out'  => 'sponsors/sessions#destroy', :as => :destroy_sponsor_session, via: 'delete'
    match 'sign_out'  => 'sponsors/sessions#destroy', :as => :destroy_user_session, via: 'delete'
  end

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
