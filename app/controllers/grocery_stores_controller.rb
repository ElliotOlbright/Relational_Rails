class GroceryStoresController < ApplicationController
  def index
    @grocery_stores = GroceryStore.order(created_at: :desc)
  end

  def show
    @grocery_store = GroceryStore.find(params[:id])
  end

  def new
  end

  def create
    grocery_store = GroceryStore.create(
      name:params[:name],
      address:params[:address],
      open_24_hours:params[:open_24_hours]
    )
    redirect_to '/grocery_stores'
  end

  def edit
    @grocery_store = GroceryStore.find(params[:id])
  end

  def update
    @grocery_store = GroceryStore.find(params[:id])
    @grocery_store.update(
      name: params[:name],
      address: params[:address],
      open_24_hours: params[:open_24_hours]
      )
    @grocery_store.save
    redirect_to "/grocery_stores/#{@grocery_store.id}"
  end

  def destroy
    GroceryStore.destroy(params[:id])
    redirect_to '/grocery_stores'
  end
end