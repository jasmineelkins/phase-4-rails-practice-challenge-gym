Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clients, only: %i[index show update]
  resources :gyms, only: %i[index show update destroy]
  resources :memberships, only: [:create]
end
