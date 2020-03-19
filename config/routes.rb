Rails.application.routes.draw do

  get 'comments/create'

  root 'questions#index'

  devise_for :users

  resources :questions do
    resources :answers, only: [:create]
  end
end
