require 'rails_helper'

RSpec.describe Car do
  it {should belong_to :dealership}
  describe 'instance methods' do 
    it 'can order by alphabet' do 
      dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

      beta = dealer1.cars.create!(model: 'beta', 
                                  make: 'Lamborghini', 
                                  year: 2020, 
                                  under_100k_miles: true
                                )

      alpha = dealer1.cars.create!(model: 'alpha', 
                                  make: 'Audi', 
                                  year: 2022, 
                                  under_100k_miles: true
                                )   
      charlie = dealer1.cars.create!(model: 'charlie', 
                                    make: 'Audi', 
                                    year: 2000, 
                                    under_100k_miles: true
                                  )   

      expect(dealer1.cars.alph_order).to eq([alpha, beta, charlie])
    end 

    it 'canfind cars under 100k miles' do 
      dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

      beta = dealer1.cars.create!(model: 'beta', 
                                  make: 'Lamborghini', 
                                  year: 2020, 
                                  under_100k_miles: true
                                )

      alpha = dealer1.cars.create!(model: 'alpha', 
                                  make: 'Audi', 
                                  year: 2022, 
                                  under_100k_miles: false
                                )   
      charlie = dealer1.cars.create!(model: 'charlie', 
                                    make: 'Audi', 
                                    year: 2000, 
                                    under_100k_miles: true
                                  )   

      expect(dealer1.cars.under_100k_miles).to eq([beta, charlie])
    end 
  end
end