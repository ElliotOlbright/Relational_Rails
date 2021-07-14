class CarsController < ApplicationController
  def index
    if params[:make_of_car].present?
      @cars = Car.where("make = ?", params[:make_of_car])
    else
      @cars = Car.under_100k_miles
    end
  end
  
  def show 
    @car = Car.find(params[:id])
  end 

  def edit 
    @car = Car.find(params[:id])
  end 

  def update 
    @car = Car.find(params[:id])
    # @car.attributes = car_params
    car_params.each do |attr, value| 
      if value.present?
        @car[attr] = value
        @car.save
      end 
    end 

    redirect_to "/cars/#{@car.id}"
  end

  def destroy
    car = Car.find(params[:id])

    car.destroy
    redirect_to '/cars'
  end

private
  def car_params
    params.permit(:model, :make, :year, :under_100k_miles)
  end
end 