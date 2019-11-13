class CreatePurchasedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :purchased_products do |t|
    	t.integer  :order_id
    	t.integer  :product_id
    	t.integer  :price
    	t.integer  :count

      t.timestamps
    end
  end
end
