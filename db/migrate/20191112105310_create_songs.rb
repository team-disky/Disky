class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
    	t.integer  :disc_id
    	t.string  :title
    	t.integer  :number
    	t.integer  :recording_time

      t.timestamps
    end
  end
end
