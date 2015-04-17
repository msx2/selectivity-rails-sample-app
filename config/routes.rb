Rails.application.routes.draw do
  post '/' => 'home#index'

  root 'home#index'
end
