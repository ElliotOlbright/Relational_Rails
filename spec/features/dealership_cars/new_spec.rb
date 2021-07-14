require 'rails_helper'

describe 'Dealership Cars New page' do 
  before :each do
    @dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

    @lambo = @dealer1.cars.create!(model: 'diablo', 
                                  make: 'Lamborghini', 
                                  year: 2020, 
                                  under_100k_miles: true
                                )
    
    visit "/dealerships/#{@dealer1.id}/new"
  end

  it 'Can see Add car model' do 
    
    expect(page).to have_content('Add Car to Lot')
  end 

  it 'Can see Add Car Form' do 

    expect(page).to have_field(:model)
    expect(page).to have_field(:make)
    expect(page).to have_field(:year)
    expect(page).to have_field(:under_100k_miles)
  end 

  it 'Can create a new Car' do 

    click_button ('Add to Lot')

    expect(current_path).to eq("/dealerships/#{@dealer1.id}/cars")
    expect(page).to have_content('Model:')
  end 

  it 'can see fill in New Car Form' do 

    fill_in :model, with: "Example Model"
    fill_in :Make, with: "Example Make"
    fill_in :year, with: "2030"
    fill_in :under_100k_miles, with: true

    click_button('Add to Lot')

    expect(current_path).to eq("/dealerships/#{@dealer1.id}/cars")
    expect(page).to have_content("Example Model")
    expect(page).to have_content("Example Make")
    expect(page).to have_content("2030")
  end 
end 