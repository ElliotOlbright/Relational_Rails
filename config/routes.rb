Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/dealerships/:dealership_id/cars', to: 'dealership_cars#index'

  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
end
