class AddFirstNameReadToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name_read, :string
  end
end
