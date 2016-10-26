Rails.application.routes.draw do

  root to: 'movies#index'
  resources :movies
  post 'movies/show' => 'movies#show', as: 'movies_show'
end
