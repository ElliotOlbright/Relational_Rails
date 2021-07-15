class GroceryStoresController < ApplicationController
  def index
    if params[:name].present?
      @grocery_stores = GroceryStore.where("lower(name) LIKE ?", "%#{params[:name].downcase}%")
    elsif params[:sort] == "groceries"
      @grocery_stores = GroceryStore.all.sort_by{ |store| -store.groceries.count } 
    else
      @grocery_stores = GroceryStore.order(created_at: :desc)
    end
  end

  def show
    @grocery_store = GroceryStore.find(params[:id])
  end

  def new
  end

  def create
    grocery_store = GroceryStore.create(store_params)
    redirect_to '/grocery_stores'
  end

  def edit
    @grocery_store = GroceryStore.find(params[:id])
  end

  def update
    @grocery_store = GroceryStore.find(params[:id])
    store_params.each do |attr, value|
      if value.present?
        @grocery_store[attr] = value
        @grocery_store.save
      end
    end
    redirect_to "/grocery_stores/#{@grocery_store.id}"
  end

  def destroy
    GroceryStore.destroy(params[:id])
    redirect_to '/grocery_stores'
  end

private
  def store_params
    params.permit(:name, :address, :open_24_hours, :departments)
  end
end