Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:  "top#index"

  resources :lists, only: %i(new create edit update destroy) do
    resources :cards, except: %i(index) do
      member do
        patch :toggle_fade
      end
    end
  end

end
