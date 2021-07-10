class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.order(created_at: :desc) 
  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  def new
  end 

  def create
    dealership = Dealership.create(
                                  name:params[:name],
                                  address:params[:address],
                                  open_weekends:params[:open_weekends],
                                  years_open:params[:years_open]
                                )
    redirect_to '/dealerships'
  end

  def edit 
    @dealership = Dealership.find(params[:id])
  end

  def update 
    @dealership = Dealership.find(params[:id])
    @dealership.update(
                      name:params[:name],
                      address:params[:address],
                      open_weekends:params[:open_weekends],
                      years_open:params[:years_open]
                    )

    # @dealership.save
  
    redirect_to '/dealerships'
  end 

  def destroy
    dealership = Dealership.find(params[:id])
    dealership.cars.all.destroy
    dealership.destroy
    redirect_to '/dealerships'
  end
end