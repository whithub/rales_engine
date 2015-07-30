Rails.application.routes.draw do

  root '/'

  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        member do
          get '/revenue',  to: 'merchants#revenue'
          get '/items',                           to: 'merchants#items'
          get '/invoices',                        to: 'merchants#invoices'
          get '/favorite_customer',               to: 'merchants#fav_customer'
          get '/customers_with_pending_invoices', to: 'merchants#customers_with_pending_invoices'
        end
        collection do
          get '/random',       to: "merchants#random"
          get '/find',         to: "merchants#find"
          get '/find_all',     to: "merchants#find_all"
          get '/most_revenue', to: 'merchants#most_revenue'
        end

      end

      resources :customers, only: [:index, :show] do
        member do
          get '/invoices',     to: 'customers#invoices'
          get '/transactions', to: 'customers#transactions'
        end
        collection do
          get 'random',    to: "customers#random"
          get '/find',     to: "customers#find"
          get '/find_all', to: "customers#find_all"
        end

      end


      resources :invoices,      only: [:index, :show] do
        collection do
          get '/random',   to: "invoices#random"
          get '/find',     to: "invoices#find"
          get '/find_all', to: "invoices#find_all"
        end
        get '/customer',      to: 'invoices#customer'
        get '/merchant',      to: 'invoices#merchant'
        get '/items',         to: 'invoices#items'
        get '/invoice_items', to: 'invoices#invoice_items'
        get '/transactions',  to: 'invoices#transactions'
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get '/random',   to: "invoice_items#random"
          get '/find',     to: "invoice_items#find"
          get '/find_all', to: "invoice_items#find_all"
        end
        get '/item',    to: 'invoice_items#item'
        get '/invoice', to: 'invoice_items#invoice'

      end

      resources :items, only: [:index, :show] do
        collection do
          get '/random',   to: "items#random"
          get '/find',     to: "items#find"
          get '/find_all', to: "items#find_all"
        end
        get '/merchant',      to: 'items#merchant'
        get '/invoice_items', to: 'items#invoice_items'
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get '/random',   to: "transactions#random"
          get '/find',     to: "transactions#find"
          get '/find_all', to: "transactions#find_all"
        end
        get '/invoice', to: 'transactions#invoice'
      end

    end
  end

end
