class CarsController < ApplicationController
  def index
    @cars = Car.under_100k_miles
  end
  
  def show 
    @car = Car.find(params[:id])
  end 

  def edit 
    @car = Car.find(params[:id])
  end 

  def update 
    @car = Car.find(params[:id])
    @car.update(
                model:params[:model],
                make:params[:make],
                year:params[:year],
                under_100k_miles:params[:under_100k_miles]
                )
    @car.save
  
    redirect_to "/cars/#{@car.id}"
  end

  def destroy
    car = Car.find(params[:id])

    car.destroy
    redirect_to '/cars'
  end
end 