class DealershipCarsController < ApplicationController
  def index
    
    @dealership = Dealership.find(params[:dealership_id])
    @cars = @dealership.cars
  end 
end 