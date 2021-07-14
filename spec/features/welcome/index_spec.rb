require 'rails_helper'

describe 'Welcome page' do 
  before :each do
    visit '/'
  end

  it 'can take the user to the grocery stores page' do 
    
    click_link('Go to Grocery Stores')
    expect(current_path).to eq('/grocery_stores')
  end 

  it 'can take the user to the dealership page' do 
  
    click_link('Go to Dealerships')
    expect(current_path).to eq('/dealerships')
  end 
end 
