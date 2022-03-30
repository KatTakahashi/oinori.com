Rails.application.routes.draw do
  root 'posts#top'
  resources :posts, only: [:create, :destroy] do
    resource :lols, only:[:create]
  end
  
  # Admin ログイン/ログアウト機能
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
