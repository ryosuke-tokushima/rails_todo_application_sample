Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:  "top#index"

  resources :lists, only: %i(new create edit update destroy) do
    resources :card, except: %i(index)
  end
end
