class AddDepartmentsToGroceryStores < ActiveRecord::Migration[5.2]
  def change
    add_column :grocery_stores, :departments, :integer
  end
end
