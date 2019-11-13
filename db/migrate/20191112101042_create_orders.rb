class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer  :customer_id
      t.integer  :status, default: 0
      t.integer  :payment_method
      t.integer  :total_amount
      t.integer  :subtotal_amount
      t.string  :contractee_name
      t.string  :contractee_phone_number
      t.string  :postal_code
      t.string  :destination_name
      t.string  :destination_address
      t.string  :destination_phone_number
      t.integer  :postage, default: 500


      t.timestamps
    end
      add_index :orders, :contractee_name
  end
end
