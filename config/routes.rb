Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      get '/merchants/random',   to: "merchants#random"
      get '/merchants/find',     to: "merchants#search"
      get '/merchants/find_all', to: "merchants#search_all"




    end
  end


end
