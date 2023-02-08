Rails.application.routes.draw do
  # resources :denominations
  # resources :products

  root "shops#index"
  resources :shops do
     resources :products
  end
  resources :shops do
    resources :denominations
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
