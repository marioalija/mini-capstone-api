class Order < ApplicationRecord
  has_many :carted_products
  belongs_to :user

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
