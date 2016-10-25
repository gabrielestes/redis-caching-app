Rails.application.routes.draw do

  get 'movies/index'

  get 'movies/show'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
