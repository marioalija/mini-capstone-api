class Product < ApplicationRecord
  def description_list
    description.split(", ")
  end

  def is_discounted?
    if price <= 10
      true
    else
      false
    end
  end

  def tax
    tax = price * 0.09
    tax.round(2)
  end

  def total
    total = price + tax
  end
end
