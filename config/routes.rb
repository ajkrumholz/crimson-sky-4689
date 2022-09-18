Rails.application.routes.draw do

  resources :chefs do
    resources :dishes, only: [:show]
    resources :ingredients, only: [:index]
  end

end