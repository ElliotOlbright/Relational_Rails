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
    @grocery.update(
      name:params[:name],
      price:params[:price],
      in_stock:params[:in_stock]
    )
    @grocery.save
  
    redirect_to "/groceries/#{@grocery.id}"
  end
end