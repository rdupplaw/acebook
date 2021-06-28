# frozen_string_literal: true

Rails.application.routes.draw do
   get '/login', to: 'sessions#new'
   post '/login', to: 'sessions#create'
   delete '/logout', to: 'sessions#destroy'

   resources :users
  
   resources :posts do
      resources :comments
      get '/like' , on: :member, to: 'posts#like'
   end
end
