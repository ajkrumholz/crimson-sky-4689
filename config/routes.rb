Rails.application.routes.draw do

  resources :chefs do
    resources :dishes, only: [:show]
  end

end