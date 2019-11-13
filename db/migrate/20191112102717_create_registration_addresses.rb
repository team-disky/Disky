class CreateRegistrationAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :registration_addresses do |t|

    	t.string  :name
    	t.string  :phone_number
    	t.string  :postal_code
    	t.string  :address
    	t.integer  :customer_id

      t.timestamps
    end
  end
end
