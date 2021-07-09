class Dealership < ApplicationRecord
  has_many :cars

  def car_count
    cars.count 
  end 
end 