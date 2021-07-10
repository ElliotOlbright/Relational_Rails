class DealershipCarsController < ApplicationController
  def index
    
    @dealership = Dealership.find(params[:dealership_id])
    @cars = @dealership.cars
  end 

  def new 
    @dealership = Dealership.find(params[:dealership_id])
  end 

  def create 
    dealership = Dealership.find(params[:dealership_id])
    car = dealership.cars.create(
                                model:params[:model],
                                make:params[:make],
                                year:params[:year],
                                under_100k_miles:params[:under_100k_miles]
                                )

    redirect_to "/dealerships/#{dealership.id}/cars"
  end 
end 