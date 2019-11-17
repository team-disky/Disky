class AddSalesDateToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sales_date, :date
  end
end
