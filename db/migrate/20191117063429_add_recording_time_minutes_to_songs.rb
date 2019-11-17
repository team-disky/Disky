class AddRecordingTimeMinutesToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :recording_time_minutes, :integer
  end
end
