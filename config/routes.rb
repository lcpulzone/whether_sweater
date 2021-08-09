Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/breweries', to: 'breweries#index'
      get '/forecast', to: 'forecasts#index'
    end
  end
end
