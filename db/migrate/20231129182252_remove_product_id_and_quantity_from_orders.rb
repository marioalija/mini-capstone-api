class RemoveProductIdAndQuantityFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :product_id
    remove_column :orders, :quantity
  end
end
