Rails.application.routes.draw do
  root 'postss#top'
  resources :posts, only: [:create, :destroy] do
    resource :post_lols, only:[:create]
  end
end
