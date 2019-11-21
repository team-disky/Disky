class AddCountToArrival < ActiveRecord::Migration[5.2]
  def change
    add_column :arrivals, :count, :integer
  end
end
