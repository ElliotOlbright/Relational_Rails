class GroceryStoreGroceriesController < ApplicationController
  def index
    @grocery_store = GroceryStore.find(params[:grocery_store_id])
    @groceries = @grocery_store.groceries
  end
end