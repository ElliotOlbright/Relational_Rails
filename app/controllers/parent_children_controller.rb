class ParentChildrenController < ApplicationController
  def index
    
    @dealership = Dealership.find(params[:parent_id])
    @cars = @dealership.cars
  end 
end 