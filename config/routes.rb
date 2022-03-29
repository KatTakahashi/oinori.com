Rails.application.routes.draw do
  root 'posts#top'
  resources :posts, only: [:create, :destroy] do
    resource :lols, only:[:create]
  end
end
