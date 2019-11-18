class AddDateToArrival < ActiveRecord::Migration[5.2]
  def change
    add_column :arrivals, :date, :date
  end
end
