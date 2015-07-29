Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do


      resources :merchants, except: [:new, :update] do
        member do
          get '/items',    to: 'merchants#items'
          get '/invoices', to: 'merchants#invoices'
          get '/revenue',  to: 'merchants#revenue'
          get '/favorite_customer', to: 'merchants#fav_customer'
          get '/customers_with_pending_invoices', to: 'merchants#customers_with_pending_invoices'
        end
        collection do
          get '/random',   to: "merchants#random"
          get '/find',     to: "merchants#search"
          get '/find_all', to: "merchants#search_all"
          get '/most_revenue', to: 'merchants#most_revenue'
        end

      end

      get '/customers/random',   to: "customers#random"
      get '/customers/find',     to: "customers#search"
      get '/customers/find_all', to: "customers#search_all"
      resources :customers, except: [:new, :update] do
        get '/invoices',     to: 'customers#invoices'
        get '/transactions', to: 'customers#transactions'

      end

      get '/invoices/random',   to: "invoices#random"
      get '/invoices/find',     to: "invoices#search"
      get '/invoices/find_all', to: "invoices#search_all"
      resources :invoices, except: [:new, :update] do
        get 'customer',      to: 'invoices#customer'
        get 'merchant',      to: 'invoices#merchant'
        get 'items',         to: 'invoices#items'
        get 'invoice_items', to: 'invoices#invoice_items'
        get 'transactions',  to: 'invoices#transactions'
      end

      get '/invoice_items/random',   to: "invoice_items#random"
      get '/invoice_items/find',     to: "invoice_items#search"
      get '/invoice_items/find_all', to: "invoice_items#search_all"
      resources :invoice_items, except: [:new, :update] do
        get 'item',    to: 'invoice_items#item'
        get 'invoice', to: 'invoice_items#invoice'
      end

      get '/items/random',   to: "items#random"
      get '/items/find',     to: "items#search"
      get '/items/find_all', to: "items#search_all"
      resources :items, except: [:new, :update] do
        get '/merchant',      to: 'items#merchant'
        get '/invoice_items', to: 'items#invoice_items'
      end

      get '/transactions/random',   to: "transactions#random"
      get '/transactions/find',     to: "transactions#search"
      get '/transactions/find_all', to: "transactions#search_all"
      resources :transactions, except: [:new, :update] do
        get 'invoice', to: 'transactions#invoice'
      end

    end
  end

end
