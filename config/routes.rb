Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :destroy] do
    resource :post_lol, only:[:create]
  end
end
