Rails.application.routes.draw do
  resources :items
  devise_for :users, controllers: { omniauth_callbacks: "callbacks"}

  root to: "buckets#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
