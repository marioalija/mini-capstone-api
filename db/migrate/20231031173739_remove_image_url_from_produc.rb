class RemoveImageUrlFromProduc < ActiveRecord::Migration[7.0]
  def change
    remove_column :producs, :image_url, :string
  end
end
