Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'
   get "/rules", to: "static_pages#rules", as: "rulels"
  resources :users
  resources :matchups

end
