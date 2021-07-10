Rails.application.routes.draw do
  #Welcome page
  get '/', to: 'welcome#index'

  #Dealership/Cars routes
  get '/dealerships', to: 'dealerships#index', as: "dashboard"
  post '/dealerships', to: 'dealerships#create'
  get '/dealerships/new', to: 'dealerships#new'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/dealerships/:id/edit', to: 'dealerships#edit'
  patch '/dealerships/:id', to: 'dealerships#update'
  delete '/dealerships/:id/delete', to: 'dealerships#destroy'
  
  
  get '/dealerships/:dealership_id/cars', to: 'dealership_cars#index'
  get '/dealerships/:dealership_id/new', to: 'dealership_cars#new'
  post '/dealerships/:dealership_id/cars', to: 'dealership_cars#create'

  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/cars/:id/edit', to: 'cars#edit'
  patch '/cars/:id', to: 'cars#update'


  #Grocery Stores/Groceries routes
  get '/grocery_stores', to: 'grocery_stores#index'
  get '/grocery_stores/:id', to: 'grocery_stores#show'
  get '/groceries', to: 'groceries#index'
  get '/groceries/:id', to: 'groceries#show'
  get '/grocery_stores/:grocery_store_id/groceries', to: 'grocery_store_groceries#index'
end
