require 'rails_helper'

describe 'Cars Edit page' do 
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
  
  it 'can see Update car model' do 
    
    visit "/cars/#{@lambo.id}/edit"
    expect(page).to have_content("Update #{@lambo.make}")
  end 

  it 'can see Update car form' do 
    
    visit "/cars/#{@lambo.id}/edit"

    expect(page).to have_field("Model of Your Car (#{@lambo.model})")
    expect(page).to have_field("Make of your Car (#{@lambo.make})")
    expect(page).to have_field("Year of your car (#{@lambo.year})")
    expect(page).to have_field("Under 100k Miles (#{@lambo.under_100k_miles})")
  end 

  it 'can see Update car form' do 
 
    visit "/cars/#{@lambo.id}/edit"

    click_button('Update')
    expect(page).to have_content("Model:")
  end 

  it 'can see fill in Car edit form' do 

    visit "/cars/#{@lambo.id}/edit"

    fill_in :model, with: "Example Model"
    fill_in :make, with: "Example Make"
    fill_in :year, with: "2012"
    fill_in :under_100k_miles, with: "true"

    click_button('Update')

    expect(current_path).to eq("/cars/#{@lambo.id}")
    expect(page).to have_content("Model: Example Model")
    expect(page).to have_content("Make: Example Make")
    expect(page).to have_content("Year: 2012")
  end 
end 

