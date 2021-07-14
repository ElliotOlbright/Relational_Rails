class DealershipsController < ApplicationController
  def index
    if params[:dealer_name].present?
      @dealerships = Dealership.where("name like ?", "%#{params[:dealer_name]}%")
    else
      @dealerships = Dealership.order(created_at: :desc)
    end 
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
    dealer_params.each do |attr, value| 
      if value.present?
        @dealership[attr] = value
        @dealership.save
      end 
    end 
  
    redirect_to "/dealerships/#{@dealership.id}"
  end 

  def destroy
    dealership = Dealership.find(params[:id])

    dealership.destroy
    redirect_to '/dealerships'
  end

private
  def dealer_params
    params.permit(:name, :address, :open_weekends, :years_open)
  end
end