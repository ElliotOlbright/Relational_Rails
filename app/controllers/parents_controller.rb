class ParentsController < ApplicationController
  def index
    @grocery_stores = GroceryStore.all
  end

  def show
    @grocery_store = GroceryStore.find(params[:id])
  end
end