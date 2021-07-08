class ChildrenController < ApplicationController
  def index
    @groceries = Grocery.all
  end

  def show
    @grocery = Grocery.find(params[:id])
  end
end