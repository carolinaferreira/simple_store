Rails.application.routes.draw do
  resources :departments
  get "products/search", to: "products#search", as: :search_products
  resources :products, only: [:new, :create, :destroy]
  root to: "products#index"
end
