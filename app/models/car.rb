class Car < ApplicationRecord
  belongs_to :dealership

  def self.under_100k_miles
    where("under_100k_miles = true")
  end

  def self.alph_order
    order(:model)
  end

end 