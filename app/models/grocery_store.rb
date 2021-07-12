class GroceryStore < ApplicationRecord
  has_many :groceries, :dependent => :destroy

  def grocery_count
    self.groceries.count
  end
end