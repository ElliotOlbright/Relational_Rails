require 'rails_helper'

RSpec.describe GroceryStore do
  it {should have_many :groceries}
end