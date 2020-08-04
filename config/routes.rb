Rails.application.routes.draw do
  resources :users
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'places', to: 'places#index'
end
