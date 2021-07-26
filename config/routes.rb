Rails.application.routes.draw do
  root to: redirect("/#{I18n.locale}"), as: :redirected_root
  scope "(:locale)", locale: /uk|en/ do
    root to: "couriers#index"
    resources :couriers, except: [:delete] do
      resources :packages, only: [:create, :update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end