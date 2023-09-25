class Book < ApplicationRecord

  def self.correct_quantity(quantity)
    if quantity <= 0
      raise ActiveRecord::StatementInvalid, "Quantity Must be a Valid Number"
    else
      quantity
    end
  end
end