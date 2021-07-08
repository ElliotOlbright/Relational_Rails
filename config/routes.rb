Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/parents', to: 'parents#index'
  get '/parents/:id', to: 'parents#show'
  get '/child_table_name', to: 'children#index'
  get '/child_table_name/:id', to: 'children#show'
  get '/parents/:parent_id/child_table_name', to: 'parent_children#index'
end
