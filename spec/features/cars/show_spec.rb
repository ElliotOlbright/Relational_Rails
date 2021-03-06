require 'rails_helper'

describe 'Cars page' do 
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

    visit "/cars/#{@lambo.id}"
  end

  it 'can see all cars make and year' do 
    
    expect(page).to have_content(@lambo.make)
    expect(page).to have_content("Year: #{@lambo.year}")
  end 

  it 'can take the user to the home page' do 
      
    click_link('Go to HomePage')
    expect(current_path).to eq('/')
  end 

  it 'can take the user to the dealership page' do 
      
    click_link('Go to Dealerships')
    expect(current_path).to eq('/dealerships')
  end 

  it 'can take the user to the car page' do 
      
    click_link('Go to Cars')
    expect(current_path).to eq('/cars')
  end 

  it 'can take the user to the edit car page' do 
 
    click_link('Edit Car')
    expect(current_path).to eq("/cars/#{@lambo.id}/edit")
  end 

  it 'can take the user to delete a car' do 
    
    expect(page).to have_content(@lambo.model)

    click_link('Delete Car')
    expect(current_path).to eq('/cars')
    expect(page).to have_no_content(@lambo.model)
  end 
end 