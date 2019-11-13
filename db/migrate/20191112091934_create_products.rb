class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer  :artist_id
      t.integer	 :record_label_id
      t.integer  :format
      t.integer  :category_id
      t.integer  :status, default: 0
      t.string   :title
      t.string   :image_id
      t.datetime :sales_date
      t.integer  :price
      t.boolean  :active_flag,  default: true

      t.timestamps
    end


    add_index :products, :title
  end
end
