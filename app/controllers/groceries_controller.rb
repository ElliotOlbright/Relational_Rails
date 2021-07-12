class GroceriesController < ApplicationController
  def index
    @groceries = Grocery.all
  end

  def show
    @grocery = Grocery.find(params[:id])
  end

  def edit
    @grocery = Grocery.find(params[:id])
  end

  def update
    @grocery = Grocery.find(params[:id])
    @grocery.update(grocery_params)
    @grocery.save
  
    redirect_to "/groceries/#{@grocery.id}"
  end

  def destroy
    grocery = Grocery.destroy(params[:id])
    redirect_to '/groceries'
  end

private
  def grocery_params
    params.permit(:name, :price, :in_stock)
  end
end