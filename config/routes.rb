Rails.application.routes.draw do
  resources :images, only: [:index, :show, :new, :create] do
    member do
      get 'picture_for'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
