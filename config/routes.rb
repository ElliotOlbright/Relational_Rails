Rails.application.routes.draw do
  #Welcome page
  get '/', to: 'welcome#index'

  #Dealership/Cars routes
  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/dealerships/:dealership_id/cars', to: 'dealership_cars#index'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  #Grocery Stores/Groceries routes
  get '/grocery_stores', to: 'grocery_stores#index'
  get '/grocery_stores/new', to: 'grocery_stores#new'
  get '/grocery_stores/:id', to: 'grocery_stores#show'
  get '/groceries', to: 'groceries#index'
  get '/groceries/:id', to: 'groceries#show'
  get '/grocery_stores/:grocery_store_id/groceries', to: 'grocery_store_groceries#index'
end
