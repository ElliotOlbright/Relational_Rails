Rails.application.routes.draw do
  get '/', to: 'welcome#index'


  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/dealerships/:dealership_id/cars', to: 'dealership_cars#index'

  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'

  get '/grocery_stores', to: 'grocery_stores#index'
  get '/grocery_stores/:id', to: 'grocery_stores#show'
  get '/groceries', to: 'groceries#index'
  get '/groceries/:id', to: 'groceries#show'
  get '/grocery_stores/:grocery_store_id/groceries', to: 'grocery_store_groceries#index'

end
