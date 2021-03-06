class GroceryStoreGroceriesController < ApplicationController
  def index
    @grocery_store = GroceryStore.find(params[:grocery_store_id])
    if params[:sort] == "name"
      @groceries = @grocery_store.groceries.sort_by{ |grocery| grocery.name}
    elsif params[:price].present?
      @groceries = @grocery_store.groceries.where("price > ?", params[:price])
    else
      @groceries = @grocery_store.groceries
    end
  end

  def new
    @grocery_store = GroceryStore.find(params[:grocery_store_id])
  end

  def create
    grocery_store = GroceryStore.find(params[:grocery_store_id])
    grocery = grocery_store.groceries.create(
      name:params[:name],
      price:params[:price],
      in_stock:params[:in_stock]
    )
    redirect_to "/grocery_stores/#{grocery_store.id}/groceries"
  end
end