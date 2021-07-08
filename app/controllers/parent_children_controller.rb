class ParentChildrenController < ApplicationController
  def index
    @grocery_store = GroceryStore.find(params[:parent_id])
    @groceries = @grocery_store.groceries
  end
end