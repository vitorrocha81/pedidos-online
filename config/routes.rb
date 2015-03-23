Rails.application.routes.draw do
  devise_for :users
  get 'order_items/new'

  post 'order_items/create'

  get 'orders/index'

  put 'orders/:id/finish', to: 'orders#finish', as: 'finish'


  resources :orders, only: [:show, :finish]

  resources :product_categories

  devise_for :company_admins
  resources :companies do 
    get 'company_ratings/new'
    post 'company_ratings/create', as: :create_rating
  end
  get 'products/category/:category_id', to: 'products#category'
  resources :products
  root "companies#index"
end
