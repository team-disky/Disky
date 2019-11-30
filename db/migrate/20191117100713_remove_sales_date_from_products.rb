class RemoveSalesDateFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :sales_date, :datetime
  end
end
