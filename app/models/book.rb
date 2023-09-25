class Book < ApplicationRecord

  def self.correct_quantity(quantity)
    if quantity.to_i <= 0
      raise ActiveRecord::StatementInvalid, "Quantity Must be a Valid Number"
    else
      quantity.to_i
    end
  end
end