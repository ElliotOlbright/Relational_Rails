Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/parents', to: 'parents#index'
end
