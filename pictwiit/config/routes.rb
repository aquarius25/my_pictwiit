Rails.application.routes.draw do
  devise_for :users
  root "twiits#index"
  resources :twiits do
    resources :comments ,only:[:create]
  end
  resources :users ,only: [:show]
end
