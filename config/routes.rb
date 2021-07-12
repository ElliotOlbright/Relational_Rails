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
  delete '/cars/:id/delete', to: 'cars#destroy'

  #Grocery Stores/Groceries routes
  get '/grocery_stores', to: 'grocery_stores#index'
  post '/grocery_stores', to: 'grocery_stores#create'
  get '/grocery_stores/new', to: 'grocery_stores#new'
  
  get '/grocery_stores/:id', to: 'grocery_stores#show'
  get '/grocery_stores/:id/edit', to: 'grocery_stores#edit'
  patch '/grocery_stores/:id', to: 'grocery_stores#update'
  delete '/grocery_stores/:id/delete', to: 'grocery_stores#destroy'
  
  get '/groceries', to: 'groceries#index'
  get '/groceries/:id', to: 'groceries#show'
  get '/groceries/:id/edit', to: 'groceries#edit'
  patch '/groceries/:id', to: 'groceries#update'

  get '/grocery_stores/:grocery_store_id/groceries', to: 'grocery_store_groceries#index'
  get '/grocery_stores/:grocery_store_id/groceries/new', to: 'grocery_store_groceries#new'
  
  post '/grocery_stores/:grocery_store_id/groceries', to: 'grocery_store_groceries#create'
  get '/groceries/:grocery_store_id', to: 'groceries#show'
  delete '/groceries/:id/delete', to: 'groceries#destroy'
end
