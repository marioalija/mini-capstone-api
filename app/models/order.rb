class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def subtotal
    @product = Product.find_by(id: product_id)
    subtotal = @product[:price] * quantity
    return subtotal
  end

  def tax
    subtotal * 0.09
  end

  def total
    total = subtotal + tax
    return total
  end
end
