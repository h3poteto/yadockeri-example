Rails.application.routes.draw do

  root to: 'images#index'

  resources :images, only: [:index, :new, :create] do
    member do
      get 'picture_for'
    end
  end
end
