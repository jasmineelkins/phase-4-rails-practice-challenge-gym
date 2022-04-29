Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clients, only: %i[index show create update destroy]
  resources :gyms, only: %i[index show create update destroy]
  resources :memberships, only: %i[index show create update destroy]
end
