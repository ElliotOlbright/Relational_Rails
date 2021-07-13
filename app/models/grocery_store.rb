class GroceryStore < ApplicationRecord
  has_many :groceries, :dependent => :destroy

  def grocery_count
    groceries.count
  end
end