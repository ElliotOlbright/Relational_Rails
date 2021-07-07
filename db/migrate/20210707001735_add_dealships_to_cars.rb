class AddDealshipsToCars < ActiveRecord::Migration[5.2]
  def change
    add_reference :cars, :dealership, foreign_key: true
  end
end
