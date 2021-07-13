class DealershipCarsController < ApplicationController
  def index
    @dealership = Dealership.find(params[:dealership_id])
    if params[:age].present?
      @cars = @dealership.cars.where("year > ?", params[:age])
    elsif params[:sort] == "model"
      @cars = @dealership.cars.alph_order
    else 
      @cars = @dealership.cars
    end  

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