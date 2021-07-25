Rails.application.routes.draw do
  root to: "couriers#index"
  resources :couriers, except: [:delete] do
    resources :packages, only: [:create, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end