Rails.application.routes.draw do
  root to: "areas#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :areas, only: [:index, :show]
  resources :weekly_emails, only: [:new, :create]
  post '/mail', to: 'areas#mail'
end
