require 'rails_helper'

RSpec.describe Dealership do
  it {should have_many :cars}
  describe 'instance methods' do 
    it 'counts number of cars' do
      dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

      lambo = dealer1.cars.create!(model: 'diablo', 
                                  make: 'Lamborghini', 
                                  year: 2020, 
                                  under_100k_miles: true
                                )

      r8 = dealer1.cars.create!(model: 'R8', 
                                make: 'Audi', 
                                year: 2022, 
                                under_100k_miles: true
                              )   

      expect(dealer1.car_count).to eq(2)
    end 
  end
end