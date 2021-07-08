class ChildrenController < ApplicationController
  def index
    @groceries = Grocery.all
  end
end