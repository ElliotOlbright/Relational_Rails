class Dealership < ApplicationRecord
  has_many :cars, :dependent => :destroy

  def car_count
    cars.count 
  end 
end 