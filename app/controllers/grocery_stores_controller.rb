class GroceryStoresController < ApplicationController
  def index
    @grocery_stores = GroceryStore.order(created_at: :desc)
  end

  def show
    @grocery_store = GroceryStore.find(params[:id])
  end

  def new
  end
end