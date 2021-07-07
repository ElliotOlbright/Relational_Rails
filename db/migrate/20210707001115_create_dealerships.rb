class CreateDealerships < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.string :address
      t.boolean :open_weekends
      t.integer :years_open

      t.timestamps
    end
  end
end
