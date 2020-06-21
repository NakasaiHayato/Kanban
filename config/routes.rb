Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'

  resources :list, only: %i(new create edit update destroy) do
    # index以外のアクションをルーティング
    resources :card, except: %i(index)
  end
  resources :user, only: %i(show edit update)
end
