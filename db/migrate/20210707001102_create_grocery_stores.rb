class CreateGroceryStores < ActiveRecord::Migration[5.2]
  def change
    create_table :grocery_stores do |t|
      t.string :name
      t.string :address
      t.boolean :open_24_hours

      t.timestamps
    end
  end
end
