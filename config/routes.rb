Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'
  get "/rules", to: "static_pages#rules", as: "rules"
  get "/admin", to: "static_pages#admin", as: "admin"
  get "/history", to: "static_pages#history", as: "history"

  resources :users
  resources :matchups
  resources :picks

end
