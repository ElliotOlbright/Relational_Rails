class AddGroceryStoresToGroceries < ActiveRecord::Migration[5.2]
  def change
    add_reference :groceries, :grocery_stores, foreign_key: true
  end
end
