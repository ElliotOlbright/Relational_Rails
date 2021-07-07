class CreateGroceries < ActiveRecord::Migration[5.2]
  def change
    create_table :groceries do |t|
      t.string :name
      t.float :price
      t.boolean :in_stock

      t.timestamps
    end
  end
end
