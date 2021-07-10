require 'rails_helper'

RSpec.describe Grocery do
  it {should belong_to :grocery_store}
end