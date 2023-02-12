Rails.application.routes.draw do
  # resources :bills
  # resources :denominations
  # resources :products

  root to:"bills#index",shop_id: 1
  resources :shops do
     resources :products
  end
  resources :shops do
    resources :denominations
  end
  resources :shops do
    resources :bills
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
