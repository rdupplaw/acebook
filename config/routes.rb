# frozen_string_literal: true

Rails.application.routes.draw do
 
 resources :users
 resources :stylesheets
  
 resources :posts do
    resources :comments
    get '/like' , on: :member, to: 'posts#like'
 end

end
