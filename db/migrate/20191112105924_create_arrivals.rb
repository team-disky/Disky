class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.datetime :arrival_date
      t.integer :product_id

      t.timestamps
    end
  end
end
