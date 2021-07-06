class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :dealership_id
      t.string :model
      t.string :make
      t.string :year
      t.boolean :under_100k_miles

      t.timestamps
    end
  end
end
