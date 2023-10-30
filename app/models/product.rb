class Product < ApplicationRecord
  # validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :name, length: { in: 2..20 }
  # validates :price, presence: true
  # validates :price, numericality: { greater_then: 0 }
  # validates :description, presence: true
  # validates :description, length: { in: 10..250 }

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
end
