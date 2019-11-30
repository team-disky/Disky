class RemoveArrivalDateFromArrival < ActiveRecord::Migration[5.2]
  def change
    remove_column :arrivals, :arrival_date, :datetime
  end
end
