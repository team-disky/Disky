class RenameProductsIdColumnToDiscs < ActiveRecord::Migration[5.2]
  def change
  	rename_column :discs, :products_id, :product_id
  end
end
