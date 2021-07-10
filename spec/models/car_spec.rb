require 'rails_helper'

RSpec.describe Car do
  it {should belong_to :dealership}
end