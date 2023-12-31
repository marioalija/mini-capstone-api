class Product < ApplicationRecord
  # validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :name, length: { in: 2..20 }
  # validates :price, presence: true
  # validates :price, numericality: { greater_then: 0 }
  # validates :description, presence: true
  # validates :description, length: { in: 10..250 }
  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :orders, through: :carted_products

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

  def friendly_created_at
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def categories
    category_products.map do |category_product|
      category_product.category
    end
  end
end
