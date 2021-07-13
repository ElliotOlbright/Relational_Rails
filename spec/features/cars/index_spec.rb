require 'rails_helper'

describe 'Cars index page' do 
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
  end
  
  it 'can see all cars models and make' do 
    
    visit '/cars'
    
    expect(page).to have_content(@lambo.make)
    expect(page).to have_content("Year: #{@lambo.year}")
  end 

  it 'can take the user to the home page' do 
    visit '/cars'
    
    click_link('Go to HomePage')
    expect(current_path).to eq('/')
  end 

  it 'can take the user to the dealership page' do 
    visit '/cars'
  
    click_link('Go to Dealerships')
    expect(current_path).to eq('/dealerships')
  end 

  it 'can take the user to the edit car page' do 

    visit '/cars'
  
    click_link('Edit Car')
    expect(current_path).to eq("/cars/#{@lambo.id}/edit")
  end 

  it 'can take the user to delete a car' do 

    visit '/cars'

    expect(current_path).to eq('/cars')
    expect(page).to have_content(@lambo.model)

    click_link('Delete Car')
    expect(current_path).to eq('/cars')
    expect(page).to have_no_content(@lambo.model)
  end 

  it 'can take filter car model by user value' do 
    r8 = @dealer1.cars.create!(model: 'r8', 
                              make: 'Audi', 
                              year: 3000, 
                              under_100k_miles: true
                            )
    visit "/cars"

    expect(current_path).to eq('/cars')

    fill_in :make_of_car, with: 'Audi'

    click_button('Search')
    expect(current_path).to eq('/cars')
    expect(page).to have_content(r8.make)
  end 

end 
