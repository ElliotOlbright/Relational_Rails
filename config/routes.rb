Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/parents', to: 'parents#index'
  get '/parents/:id', to: 'parents#show'
end
