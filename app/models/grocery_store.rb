class GroceryStore < ApplicationRecord
  has_many :groceries

  def grocery_count
    self.groceries.count
  end
end